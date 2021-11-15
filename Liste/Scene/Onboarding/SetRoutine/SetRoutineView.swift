//
//  SetRoutineView.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit


class SetRoutineView: UIView, CodeView {
    private let titleView: UILabel = UILabel()
    private let subtitleView: UILabel = UILabel()
    let tableView: UITableView = UITableView()
    let buttonView = ButtonComponent(title: "Próximo")
    
    init() {
        super.init(frame: .zero)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        self.addSubview(titleView)
        self.addSubview(subtitleView)
        self.addSubview(tableView)
        self.addSubview(buttonView)
    }
    
    func setupConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
           titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
           titleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           
           subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 24),
           subtitleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           subtitleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
           
           tableView.topAnchor.constraint(equalTo: subtitleView.bottomAnchor, constant: 24),
           tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
           tableView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -24),
           tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        buttonView.setConstraints()
        
    }
    
    func setupAdditionalConfiguration() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 90
        tableView.allowsMultipleSelection = true
        
        self.backgroundColor = .white
        
        titleView.text = "Conte sobre o seu dia a dia"
        titleView.font = .boldSystemFont(ofSize: 28)
        
        subtitleView.text = "No meu dia a dia, eu tenho/desejo ter tempo para:"
        subtitleView.font = .systemFont(ofSize: 24)
        subtitleView.numberOfLines = 0
        
        
        buttonView.disable()
        
    }
   
}
