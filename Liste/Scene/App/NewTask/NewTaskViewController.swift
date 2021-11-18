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
        mainView.dateTextField.setInputViewDatePicker(target: self, selector: #selector(dateDone))
        mainView.hourTextField.setInputViewHourPicker(target: self, selector: #selector(hourDone))
    }
    
    @objc func dateDone() {
           if let datePicker = self.mainView.dateTextField.inputView as? UIDatePicker { // 2-1
               let dateformatter = DateFormatter() // 2-2
               dateformatter.dateStyle = .medium // 2-3
               self.mainView.dateTextField.text = dateformatter.string(from: datePicker.date) //2-4
           }
        self.mainView.dateTextField.resignFirstResponder() // 2-5
       }
    
    @objc func hourDone() {
           if let hourPicker = self.mainView.dateTextField.inputView as? UIDatePicker { // 2-1
               let hourFormatter = DateFormatter()
               hourFormatter.timeStyle = .short
               //self.mainView.hourTextField.text = hourFormatter.string(from: hourPicker.date) //tem que arrumar essa linha
               self.mainView.hourTextField.text = hourFormatter.string(from: hourPicker.date)
           }
        self.mainView.dateTextField.resignFirstResponder() // 2-5
       }
    
}

extension NewTaskViewController {
    enum Event {
        case newTask
    }
}

extension NewTaskViewController: UITextFieldDelegate {
    
}
