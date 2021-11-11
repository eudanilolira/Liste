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
    private let nextScreenButton: UIButton = UIButton()

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
    
    init(title: String, subtitle: String, image: UIImage?) {
        super.init(frame: .zero)
        self.title = title
        self.subtitle = subtitle
//        self.image = image!

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(titleView)
        self.addSubview(subtitleView)
        self.addSubview(nextScreenButton)
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 323),
            imageView.widthAnchor.constraint(equalToConstant: 218),
            
            titleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleView.widthAnchor.constraint(equalToConstant: 100),
            
            subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 24),
            subtitleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleView.widthAnchor.constraint(equalToConstant: 100),
            
            nextScreenButton.topAnchor.constraint(equalTo: subtitleView.bottomAnchor, constant: 24),
            nextScreenButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextScreenButton.widthAnchor.constraint(equalToConstant: 100),
            nextScreenButton.heightAnchor.constraint(equalToConstant: 51),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        titleView.numberOfLines = 0
        subtitleView.numberOfLines = 0
        nextScreenButton.setTitle("Definir minha rotina", for: .normal)
        nextScreenButton.backgroundColor = .orange
        self.backgroundColor = .orange
    }
}
