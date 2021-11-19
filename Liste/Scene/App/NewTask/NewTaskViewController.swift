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
    var selectedDate: Date?
    var selectedHour: Date?

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
        mainView.saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc func save() {
        TaskManager.shared.create(
            date: selectedDate,
            title: mainView.textFieldView.text ?? "Task sem nome", //TODO: Não permitir salvar sem nome
            deliverable: mainView.switchView.isOn,
            priority: mainView.radioButtonGroup.content?.rawValue,
            time: selectedHour,
            duration: Int16(mainView.sliderView.value) //TODO: Verifciar isso
        )
    }
    
    func setupTextFieldDelegate(){
        mainView.textFieldView.delegate = self
        mainView.dateTextField.setInputViewDatePicker(target: self, selector: #selector(dateDone))
        mainView.hourTextField.setInputViewHourPicker(target: self, selector: #selector(hourDone))
    }
        
}

extension NewTaskViewController {
    enum Event {
        case newTask
    }
}

extension NewTaskViewController {
    @objc func dateDone() {
        if let datePicker = self.mainView.dateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            selectedDate = datePicker.date
            self.mainView.dateTextField.text = dateformatter.string(from: datePicker.date)
       }
        self.mainView.dateTextField.resignFirstResponder() // 2-5
    }
    
    @objc func hourDone() {
           if let hourPicker = self.mainView.dateTextField.inputView as? UIDatePicker { // 2-1
               let hourFormatter = DateFormatter()
               hourFormatter.timeStyle = .short
               selectedHour = hourPicker.date
               self.mainView.hourTextField.text = hourFormatter.string(from: hourPicker.date)
           }
        self.mainView.dateTextField.resignFirstResponder() // 2-5
    }
}

extension NewTaskViewController: UITextFieldDelegate {
    
}
