//
//  SetTimeViewController.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit


class SetTimeViewController: UIViewController {
    
    //MARK: Properties
    let mainView: SetTimeView
    let viewModel: SetTimeViewModel
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: SetTimeViewModel) {
        self.viewModel = viewModel
        self.mainView = SetTimeView()
        super.init(nibName: nil, bundle: nil)
        
        self.setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
    }
}
