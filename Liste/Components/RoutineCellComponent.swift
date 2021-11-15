//
//  RoutineCellComponent.swift
//  Liste
//
//  Created by Nadia Bordoni on 11/11/21.
//

import UIKit

class RoutineCellComponent: UITableViewCell, CodeView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title: String? {
        get {buttonView.title(for: .normal)}
        set {buttonView.setTitle(newValue, for: .normal)}
    }
    
    let buttonView: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()
    
    func buildViewHierarchy() {
        self.addSubview(buttonView)
    }
    
    func setupConstraints() {
        buttonView.translatesAutoresizingMaskIntoConstraints = false
    
        
        let constraints = [
           buttonView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
           buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           buttonView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           buttonView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
           buttonView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
       
    }
    
    func setupAdditionalConfiguration() {
        self.selectionStyle = .none
    }
    
}

