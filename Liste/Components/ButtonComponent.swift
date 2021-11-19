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
        self.backgroundColor = .tangerine
        self.titleLabel?.font = Font.button
        self.setTitleColor(.raisinBlack, for: .normal)
        self.layer.cornerRadius = 10
    }
    
    func disable() {
        self.backgroundColor = .lightGray
        self.setTitleColor(.offWhite, for: .normal)
        self.isEnabled = false
    }
    
    func enable() {
        self.backgroundColor = .tangerine
        self.setTitleColor(.raisinBlack, for: .normal)
        self.isEnabled = true
    }
    
    func setConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -120),
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
