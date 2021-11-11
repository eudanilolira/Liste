//
//  ButtonComponent.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit

class ButtonComponent: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = .orange //TODO: Modificar cor
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.titleLabel?.textColor = .black
        self.layer.cornerRadius = 10
    }
    
    func disable() {
        self.backgroundColor = .gray //TODO: Modificar Cor
        self.titleLabel?.textColor = .darkGray //TODO: Modificar Cor
        self.isEnabled = false
    }
    
    func enable() {
        self.backgroundColor = .orange //TODO: Modificar Cor
        self.titleLabel?.textColor = .black //TODO: Modificar Cor
        self.isEnabled = true
    }
    
    func setConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -67),
            self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor),
            self.heightAnchor.constraint(equalToConstant: 51),
            self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 0.9),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
