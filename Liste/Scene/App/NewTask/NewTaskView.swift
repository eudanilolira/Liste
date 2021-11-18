//
//  NewTaskView.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import UIKit

class NewTaskView: UIView, CodeView {
    private let titleLabelView = LabelComponent(text: "Título")
    private let deliverableLabelView = LabelComponent(text: "Entregável")
    private let dateLabelView = LabelComponent(text: "Data")
    private let timeLabelView = LabelComponent(text: "Hora")
    private let durationLabelView = LabelComponent(text: "Duração")
    private let priorityLabelView = LabelComponent(text: "Prioridade")
    private let stepsLabelView = LabelComponent(text: "Etapas")
    let textFieldView: UITextField = UITextField()
    private let lineView: UIView = UIView()
    let dateTextField: UITextField = UITextField()
    
   
    let switchView: UISwitch = UISwitch()
    
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(titleLabelView)
        self.addSubview(textFieldView)
        self.addSubview(switchView)
        self.addSubview(lineView)
        self.addSubview(deliverableLabelView)
        self.addSubview(dateLabelView)
        self.addSubview(dateTextField)
    }
    
    func setupConstraints() {
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        deliverableLabelView.translatesAutoresizingMaskIntoConstraints = false
        dateLabelView.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
           titleLabelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
           titleLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           
           textFieldView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           textFieldView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
           textFieldView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: 8),
           textFieldView.heightAnchor.constraint(equalToConstant: 40),
           
           lineView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 2),
           lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
           lineView.heightAnchor.constraint(equalToConstant: 2),
           lineView.widthAnchor.constraint(equalTo: textFieldView.widthAnchor, multiplier: 1.05),
           
           switchView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           switchView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24),
           
           deliverableLabelView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24),
           deliverableLabelView.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8),
           
           dateLabelView.topAnchor.constraint(equalTo: switchView.bottomAnchor, constant: 24),
           dateLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           
          dateTextField.topAnchor.constraint(equalTo: dateLabelView.bottomAnchor, constant: 8),
           dateTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           dateTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.059),
           dateTextField.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .offWhite
        textFieldView.placeholder = "Nome da sua task"
        textFieldView.font = Font.title
        textFieldView.borderStyle = .none
        textFieldView.backgroundColor = .offWhite
        textFieldView.textColor = .raisinBlack
        
        switchView.isOn = true
        switchView.setOn(true, animated: false)
        switchView.onTintColor = .tangerine
        
        lineView.backgroundColor = .antiqueWhite
        lineView.layer.cornerRadius = 15
        
        dateTextField.font = Font.subtitle
        dateTextField.textColor = .raisinBlack
        dateTextField.layer.cornerRadius = 10
        dateTextField.backgroundColor = .antiqueWhite
        dateTextField.textAlignment = .center
        
    }
    
   
}

