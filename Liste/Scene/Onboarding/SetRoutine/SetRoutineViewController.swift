//
//  SetRoutineViewController.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit


class SetRoutineViewController: UIViewController  {
    var cellTitle = ["Trabalhar", "Estudar", "Se exercitar", "Se divertir"]
    //MARK: Properties
    let mainView: SetRoutineView
    let viewModel: SetRoutineViewModel
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: SetRoutineViewModel) {
        self.viewModel = viewModel
        self.mainView = SetRoutineView()
        super.init(nibName: nil, bundle: nil)
        
        self.setupActions()
        setupTableViewDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
    }
    
    func setupTableViewDelegate(){
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(RoutineCellComponent.self, forCellReuseIdentifier: "cellId")
    }
}

extension SetRoutineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RoutineCellComponent
        cell.title = cellTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RoutineCellComponent
        cell.buttonView.backgroundColor = .orange
        switch indexPath.row {
        case 0:
            routine.selectedWork.toggle()
        case 1:
            routine.selecteStudy.toggle()
        case 2:
            routine.selectedSports.toggle()
        case 3:
            routine.selectedFun.toggle()
        default:
            print("")
        }
       
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RoutineCellComponent
        cell.buttonView.backgroundColor = .clear
        switch indexPath.row {
        case 0:
            routine.selectedWork.toggle()
        case 1:
            routine.selecteStudy.toggle()
        case 2:
            routine.selectedSports.toggle()
        case 3:
            routine.selectedFun.toggle()
        default:
           print("")
        }
    }
    
}
