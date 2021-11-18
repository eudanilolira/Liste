//
//  labelComponent.swift
//  Liste
//
//  Created by Nadia Bordoni on 18/11/21.
//

import UIKit

class LabelComponent: UILabel, CodeView {
    
    init(text: String) {
        super.init(frame: .zero)
        setupView()
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        self.font = Font.subtitle
        self.textColor = .raisinBlack
    }
}
