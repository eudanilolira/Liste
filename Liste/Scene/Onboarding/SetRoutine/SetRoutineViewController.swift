//
//  SetRoutineViewController.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit


class SetRoutineViewController: UIViewController {
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
    }
}
