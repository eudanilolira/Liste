//
//  NewTaskViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class NewTaskViewController: UIViewController {
    
    //MARK: Properties
    var mainView: NewTaskView
    var viewModel: NewTaskViewModel
    var didSendEventClosure: ((Event) -> Void)?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: NewTaskViewModel) {
        self.viewModel = viewModel
        self.mainView = NewTaskView()
        super.init(nibName: nil, bundle: nil)
        self.setupActions()
        
        setupTextFieldDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
    }
    
    func setupTextFieldDelegate(){
        mainView.textFieldView.delegate = self
    }
    
}

extension NewTaskViewController {
    enum Event {
        case newTask
    }
}

extension NewTaskViewController: UITextFieldDelegate {
    
}
