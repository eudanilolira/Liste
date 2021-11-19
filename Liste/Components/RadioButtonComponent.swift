//
//  RadioButtonComponent.swift
//  Liste
//
//  Created by Danilo on 18/11/21.
//

import UIKit


class RadioButtonGroup: UIStackView, CodeView {
    let buttons: [RadioButton]
    var lastButtonPressed: RadioButton? = nil
    
    var content: Priority? {
        get { self.lastButtonPressed?.value }
    }
    
    init(buttons: [RadioButton]) {
        self.buttons = buttons
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        for index in 0..<buttons.count {
            buttons[index].tag = index
            buttons[index].addTarget(self,
                                     action: #selector(press),
                                     for: .touchUpInside)
            self.addArrangedSubview(buttons[index])
        }
    }
    
    @objc func press(_ sender: RadioButton) {
        if let button = lastButtonPressed {
            button.backgroundColor = UIColor.white
        }
        
        sender.backgroundColor = UIColor.tangerine
        lastButtonPressed = sender
    }
    
    func setupConstraints() {
    }
    
    func setupAdditionalConfiguration() {
        self.axis = .horizontal
        self.distribution = .equalSpacing
    }
}

class RadioButton: UIButton {
    var value: Priority
    
    init(value: Priority) {
        self.value = value
        super.init(frame: .zero)
        
        self.setTitle(value.rawValue, for: .normal)
        self.tintColor = .black
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        
        self.layer.borderColor = UIColor.tangerine.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 111).isActive = true
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Priority: String {
    case high = "Alta"
    case medium = "Média"
    case low = "Baixa"
}
