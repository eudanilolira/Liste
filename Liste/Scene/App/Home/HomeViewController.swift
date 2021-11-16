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
        mainView.tableView.register(TaskCellComponent.self, forCellReuseIdentifier: "taskCell")
    }
    
}

extension HomeViewController {
    enum Event {
        case home
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Priorities"
        
        
        return label
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCellComponent
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! RoutineCellComponent
//        cell.buttonView.backgroundColor = .orange
//        selectActivity(index: indexPath.row)
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! RoutineCellComponent
//        cell.buttonView.backgroundColor = .clear
//        selectActivity(index: indexPath.row)
        
    }
