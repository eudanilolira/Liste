//
//  HomeView.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import UIKit

class HomeView: UIView, CodeView {
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
