//
//  HomeViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Properties
    var mainView: HomeView
    var viewModel: HomeViewModel
    var didSendEventClosure: ((Event) -> Void)?
    
    var priorityTasks: [Task] = []
    var otherTasks: [Task] = []
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegate()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.mainView = HomeView()
        super.init(nibName: nil, bundle: nil)
        self.setupActions()
        self.setupTasks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTasks() {
        
//        TaskManager.shared.create(
//            date: Date.now,
//            title: "Minha task do balacobaco",
//            deliverable: false,
//            priority: "",
//            steps: "1/5",
//            time: Date.now,
//            duration: 10)
//        
//        TaskManager.shared.create(
//            date: Date.now,
//            title: "Minha task bolada",
//            deliverable: true,
//            priority: "",
//            steps: "1/5",
//            time: Date.now,
//            duration: 10)
        
        priorityTasks = viewModel.tasks.filter { $0.priority == "alta" && !$0.complete }
        otherTasks = viewModel.tasks.filter { $0.priority != "alta" && !$0.complete }
        
        mainView.tableView.reloadData()
    }

    func setupActions() {
    }
    
    func setupTableViewDelegate(){
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(PriorityCellComponent.self, forCellReuseIdentifier: "priorityCell")
        mainView.tableView.register(TodayCellComponent.self, forCellReuseIdentifier: "taskCell")
    }
    
}

extension HomeViewController {
    enum Event {
        case home
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: mainView.tableView.frame.width,
                                        height: 20))
        let label = UILabel(frame: CGRect(x: 29,
                                          y: view.frame.height / 2,
                                          width: view.frame.width - 29,
                                          height: 20))
        label.textColor = .raisinBlack
        label.font = Font.title
        label.text =  section == 0 ? "Prioridades" : "Outras Tasks"
        
        view.backgroundColor = .offWhite
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? priorityTasks.count : otherTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "priorityCell", for: indexPath) as! PriorityCellComponent
            let task = priorityTasks[indexPath.row]
            cell.title = task.title ?? ""
            cell.steps = task.steps ?? ""
            cell.duration = task.duration
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TodayCellComponent
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {_,_,_ in }
        
        deleteAction.image = UIImage(systemName: "checkmark.circle")
        deleteAction.backgroundColor = .tangerine
  
        switch indexPath.section {
        case 0:
            priorityTasks[indexPath.row].complete = true
            priorityTasks.remove(at: indexPath.row)
        case 1:
            otherTasks[indexPath.row].complete = true
            otherTasks.remove(at: indexPath.row)
        default:
            break
        }
        
        TaskManager.shared.save()
        mainView.tableView.deleteRows(at: [indexPath], with: .left)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //chamar tela com todas as informações da task
    }
    
}
