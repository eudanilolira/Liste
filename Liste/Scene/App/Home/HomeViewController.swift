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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let view = UIView(frame: CGRect(x: 0, y: 0, width: mainView.tableView.frame.width, height: 20))
        view.backgroundColor = .offWhite
        let label = UILabel(frame: CGRect(x: 29, y: view.frame.height / 2, width: view.frame.width - 29, height: 20))
        label.textColor = .raisinBlack
        label.font = Font.title
        view.addSubview(label)
        switch section {
        case 0 :
            label.text = "Prioridades"
        case 1:
            label.text = "Outras Tasks"
        default:
            print ("")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfCells = 0
        
        switch section {
        case 0:
            numberOfCells =  2 //TODO: Colocar array com prioridades
        case 1:
            numberOfCells = 10 //TODO: colocar array com tarefas do dia
        default:
            print ("")
        }
        
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "priorityCell", for: indexPath) as! PriorityCellComponent
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TodayCellComponent
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //apagar a task
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "checkmark.circle")
        deleteAction.backgroundColor = .tangerine
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //chamar tela com todas as informações da task
        }
    
}
