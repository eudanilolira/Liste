//
//  TodayCellComponent.swift
//  Liste
//
//  Created by Nadia Bordoni on 17/11/21.
//

import UIKit

class TodayCellComponent: UITableViewCell, CodeView {
    
    let taskView: UIView = {
        let view = UIView()
        view.backgroundColor = .antiqueWhite
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleView: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.textColor = .raisinBlack
        label.font = Font.button
        return label
    }()
    
    let subtitleView: UILabel = {
        let label = UILabel()
        label.text = "due to 15:00"
        label.textColor = .raisinBlack
        label.font = Font.details
        return label
    }()
    //let tagComponent = TagComponent(tag: .deliverable)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(taskView)
        taskView.addSubview(titleView)
        taskView.addSubview(subtitleView)
        //taskView.addSubview(tagComponent)
    }
    
    func setupConstraints() {
        taskView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
       // tagComponent.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            taskView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            taskView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            taskView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            taskView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
            taskView.heightAnchor.constraint(equalToConstant: 60),
            
            titleView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 14),
            titleView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 20),
            
            subtitleView.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -14),
            subtitleView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 20),
            
            //tagComponent.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            //tagComponent.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 14),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        self.selectionStyle = .none
    }
    
    
    
    
}
