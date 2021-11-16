//
//  HomeView.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import UIKit

class HomeView: UIView, CodeView {
    private let userView = UILabel()
    let tableView = UITableView()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(userView)
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        userView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            userView.topAnchor.constraint(equalTo: self.topAnchor, constant: 63),
            userView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            
            
            tableView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 24),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .offWhite
        
        userView.text = "Oi, Nádia"
        userView.font = Font.details
        userView.textColor = .raisinBlack
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 160
        tableView.allowsMultipleSelection = true
        
    }
}
