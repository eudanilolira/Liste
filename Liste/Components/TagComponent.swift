//
//  TagComponent.swift
//  Liste
//
//  Created by Nadia Bordoni on 17/11/21.
//

import UIKit

class TagComponent: UIView, CodeView {
    let currentTag: Tags
    
    let titleView: UILabel = {
        let label = UILabel()
        label.textColor = .raisinBlack
        label.font = Font.tagFont
        label.backgroundColor = .offWhite
        return label
    }()
    
    init(tag: Tags) {
        titleView.text = tag.rawValue
        currentTag = tag
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(titleView)
    }
    
    func setupConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    func getWidth() -> Int {
        switch currentTag {
        case .low, .medium:
           return 44
        case .high:
           return 32
        case .deliverable:
            return 72
        }
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = .offWhite
        self.layer.cornerRadius = 10
    }
    
    
}
extension TagComponent {
    enum Tags: String {
        case low = "Baixa"
        case medium = "Média"
        case high = "Alta"
        case deliverable = "Entregável"
    }
}
