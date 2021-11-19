//
//  NewTaskView.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import UIKit

class NewTaskView: UIView, CodeView {
    let titleLabelView = LabelComponent(text: "Título")
    let deliverableLabelView = LabelComponent(text: "Entregável")
    let dateLabelView = LabelComponent(text: "Data")
    let timeLabelView = LabelComponent(text: "Hora")
    let durationLabelView = LabelComponent(text: "Duração")
    let priorityLabelView = LabelComponent(text: "Prioridade")
    let stepsLabelView = LabelComponent(text: "Etapas")
    let radioButtonGroup = RadioButtonGroup(buttons: [
        .init(value: .low),
        .init(value: .medium),
        .init(value: .high)
    ])
    let textFieldView: UITextField = UITextField()
    let lineView: UIView = UIView()
    let dateTextField: UITextField = UITextField()
    let hourTextField: UITextField = UITextField()
    let sliderView: UISlider = UISlider()
    let switchView: UISwitch = UISwitch()
    let fixedTimeLabelView: UILabel = UILabel()
    let mutableTimeLabelView: UILabel = UILabel()
    let saveButton =  ButtonComponent(title: "Salvar")
    
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
        self.addSubview(timeLabelView)
        self.addSubview(hourTextField)
        self.addSubview(durationLabelView)
        self.addSubview(sliderView)
        self.addSubview(mutableTimeLabelView)
        self.addSubview(fixedTimeLabelView)
        self.addSubview(priorityLabelView)
        self.addSubview(radioButtonGroup)
        self.addSubview(saveButton)
    }
    
    func setupConstraints() {
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        deliverableLabelView.translatesAutoresizingMaskIntoConstraints = false
        dateLabelView.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        timeLabelView.translatesAutoresizingMaskIntoConstraints = false
        hourTextField.translatesAutoresizingMaskIntoConstraints = false
        durationLabelView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        mutableTimeLabelView.translatesAutoresizingMaskIntoConstraints = false
        fixedTimeLabelView.translatesAutoresizingMaskIntoConstraints = false
        priorityLabelView.translatesAutoresizingMaskIntoConstraints = false
        radioButtonGroup.translatesAutoresizingMaskIntoConstraints = false

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
            dateTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.46),
            
            timeLabelView.topAnchor.constraint(equalTo: switchView.bottomAnchor, constant: 24),
            timeLabelView.leadingAnchor.constraint(equalTo: hourTextField.leadingAnchor),
            
            hourTextField.topAnchor.constraint(equalTo: timeLabelView.bottomAnchor, constant: 8),
            
            hourTextField.leftAnchor.constraint(equalTo: dateTextField.rightAnchor, constant: 45),
            hourTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.059),
            hourTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            
            durationLabelView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 24),
            durationLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            
            sliderView.topAnchor.constraint(equalTo: durationLabelView.bottomAnchor, constant: 8),
            sliderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            sliderView.trailingAnchor.constraint(equalTo: hourTextField.trailingAnchor),
            fixedTimeLabelView.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: 4),
           fixedTimeLabelView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            
            mutableTimeLabelView.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: 4),
            mutableTimeLabelView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
            
            priorityLabelView.topAnchor.constraint(equalTo: fixedTimeLabelView.bottomAnchor, constant: 24),
            priorityLabelView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            
            radioButtonGroup.topAnchor.constraint(equalTo: priorityLabelView.bottomAnchor, constant: 24),
            radioButtonGroup.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        saveButton.setConstraints()
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
        
        hourTextField.font = Font.subtitle
        hourTextField.textColor = .raisinBlack
        hourTextField.layer.cornerRadius = 10
        hourTextField.backgroundColor = .antiqueWhite
        hourTextField.textAlignment = .center
        
        sliderView.tintColor = .tangerine
        sliderView.maximumValue = 24
        sliderView.minimumValue = 1
        
        fixedTimeLabelView.textColor = .raisinBlack
        fixedTimeLabelView.font = Font.details
        fixedTimeLabelView.text = "1 hr"
        
        mutableTimeLabelView.textColor = .raisinBlack
        mutableTimeLabelView.font = Font.details
        mutableTimeLabelView.text = "24 hrs"
    }
    
    
}

