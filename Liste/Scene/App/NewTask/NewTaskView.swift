//
//  NewTaskView.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import UIKit

class NewTaskView: UIView, CodeView {
    private let titleView: UILabel = UILabel()
    let textFieldView: UITextField = UITextField()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(titleView)
        self.addSubview(textFieldView)
    }
    
    func setupConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
           titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
           titleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
           
           textFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
           textFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
           //textFieldView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
           //textFieldView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .offWhite
        
        titleView.text = "Title"
        titleView.font = Font.subtitle
        titleView.textColor = .raisinBlack
        
        textFieldView.placeholder = "Nome da sua task"
        textFieldView.font = Font.title
        textFieldView.borderStyle = .line
        textFieldView.backgroundColor = .offWhite
        textFieldView.textColor = .raisinBlack
        
    }
}
