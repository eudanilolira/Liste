//
//  TaskCellComponent.swift
//  Liste
//
//  Created by Nadia Bordoni on 16/11/21.
//

import UIKit

class PriorityCellComponent: UITableViewCell, CodeView {
    
    let taskView: UIView = {
        let view = UIView()
        view.backgroundColor = .tangerine
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleView: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.textColor = .raisinBlack
        label.font = Font.buttonFont
        return label
    }()
    
    let subtitleView: UILabel = {
        let label = UILabel()
        label.text = "due to 15:00"
        label.textColor = .raisinBlack
        label.font = Font.details
        return label
    }()

    let tagComponent = TagComponent(tag: .deliverable)
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .antiqueWhite
        //progress.trackTintColor = .offWhite
        return progress
    }()
    
    let clockImageView: UIImageView = {
        let icon = UIImage(systemName: "clock")
        let imageView = UIImageView(image: icon)
        imageView.tintColor = .raisinBlack
        imageView.sizeToFit()
        return imageView
    }()
    
    let taskImageView: UIImageView = {
        let icon = UIImage(systemName: "checklist")
        let imageView = UIImageView(image: icon)
        imageView.tintColor = .raisinBlack
        return imageView
    }()
    
    let hourLabelView: UILabel = {
        let label = UILabel()
        label.text = "2.5 hours left"
        label.font = Font.tagFont
        label.textColor = .raisinBlack
        return label
    }()
    
    let tasksLabelView: UILabel = {
        let label = UILabel()
        label.text = "1/5 tasks"
        label.font = Font.tagFont
        label.textColor = .raisinBlack
        return label
    }()
    
    
    var steps: String {
        get { self.steps }
        set { tasksLabelView.text = newValue }
    }
    
    var duration: Int16 {
        get { self.duration }
        set { hourLabelView.text = "\(newValue) horas" }
    }
    
    var title: String {
        get { self.title }
        set { titleView.text = newValue }
    }
    
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
        taskView.addSubview(tagComponent)
        taskView.addSubview(clockImageView)
        taskView.addSubview(hourLabelView)
        taskView.addSubview(taskImageView)
        taskView.addSubview(tasksLabelView)
        taskView.addSubview(progressView)
        
    }
    
    func setupConstraints() {
        taskView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        tagComponent.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        hourLabelView.translatesAutoresizingMaskIntoConstraints = false
        taskImageView.translatesAutoresizingMaskIntoConstraints = false
        tasksLabelView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            taskView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            taskView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            taskView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
            taskView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
            taskView.heightAnchor.constraint(equalToConstant: 160),
            
            titleView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 14),
            titleView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 20),
            
            subtitleView.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -14),
            subtitleView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 20),
            
            tagComponent.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            tagComponent.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            tagComponent.widthAnchor.constraint(equalToConstant: CGFloat(tagComponent.getWidth())),
            tagComponent.heightAnchor.constraint(equalToConstant: 20),
    
            clockImageView.bottomAnchor.constraint(equalTo: taskImageView.topAnchor, constant: -8 ),
            clockImageView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 14),
            clockImageView.widthAnchor.constraint(equalToConstant: 16),
            clockImageView.heightAnchor.constraint(equalToConstant: 16),
            
            hourLabelView.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 8),
            hourLabelView.bottomAnchor.constraint(equalTo: taskImageView.topAnchor, constant: -8),
            
            taskImageView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
            taskImageView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 14),
            taskImageView.widthAnchor.constraint(equalToConstant: 16),
            taskImageView.heightAnchor.constraint(equalToConstant: 16),
            
            tasksLabelView.leadingAnchor.constraint(equalTo: taskImageView.trailingAnchor, constant: 8),
            tasksLabelView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
            
            progressView.widthAnchor.constraint(equalTo: taskView.widthAnchor, multiplier: 0.9),
            progressView.centerXAnchor.constraint(equalTo: taskView.centerXAnchor),
            progressView.bottomAnchor.constraint(equalTo: taskView.bottomAnchor, constant: -14),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        self.selectionStyle = .none
    }
    
    
    
}
