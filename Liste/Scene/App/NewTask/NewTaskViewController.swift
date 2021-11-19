//
//  NewTaskViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
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
        mainView.sliderView.addTarget(self, action: #selector(chooseDuration), for: .allTouchEvents)
    }
    
    @objc func save() {
        
        if mainView.textFieldView.text != "" {
            let task = TaskManager.shared.create(
                date: selectedDate,
                title: mainView.textFieldView.text!,
                deliverable: mainView.switchView.isOn,
                priority: mainView.radioButtonGroup.content?.rawValue,
                time: selectedHour,
                duration: Int16(mainView.sliderView.value) //TODO: Verifciar isso
            )
            
            if let _ = task {
                clearFields()
                showAlert(title: "Sucesso", message: "Task criada com sucesso!")
                
            } else {
                showAlert(title: "Erro", message: "Não foi possível criar esssa task, tente novamente")
            }
            
        } else {
            showAlert(title: "Erro", message: "Defina um título para criar sua task")
        }
    }
    
    func setupTextFieldDelegate(){
        mainView.textFieldView.delegate = self
        mainView.dateTextField.setInputViewDatePicker(target: self, selector: #selector(dateDone))
        mainView.hourTextField.setInputViewHourPicker(target: self, selector: #selector(hourDone))
    }

    @objc func chooseDuration() {
        mainView.mutableTimeLabelView.text = "\(round(mainView.sliderView.value))hrs"
    }
    private func clearFields(){
        mainView.textFieldView.text = ""
        mainView.switchView.isOn = true
        mainView.sliderView.value = 0
        mainView.dateTextField.text = ""
        mainView.hourTextField.text = ""
        
        selectedHour = nil
        selectedDate = nil
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

extension NewTaskViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
