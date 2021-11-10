//
//  OnboardingView.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import UIKit

class OnboardingView: UIView, CodeView {
    private let imageView: UIImageView = UIImageView()
    private let titleView: UILabel = UILabel()
    private let subtitleView: UILabel = UILabel()
    
    var title: String? {
        get { titleView.text}
        set { titleView.text = newValue}
    }
    
    var subtitle: String? {
        get { subtitleView.text}
        set { subtitleView.text = newValue}
    }
    
    var image: UIImage? {
        get { imageView.image}
        set { imageView.image = newValue }
    }
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    init(subtitle: String, title: String, image: UIImage) {
        super.init(frame: .zero)
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(titleView)
        self.addSubview(subtitleView)
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleView.heightAnchor.constraint(equalTo: self.widthAnchor),
            titleView.widthAnchor.constraint(equalToConstant: 100),
            
            subtitleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subtitleView.heightAnchor.constraint(equalTo: self.widthAnchor),
            subtitleView.widthAnchor.constraint(equalToConstant: 100),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        subtitleView.text = "Liste é um app para anotar suas tarefas de forma a respeitar sua rotina e suas necessidades"
        titleView.text = "Bem-vindo"
    }
}
