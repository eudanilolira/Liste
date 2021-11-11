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
    let buttonView: UIButton = UIButton()
    

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
    
    init(subtitle: String, title: String, image: UIImage?, showButton: Bool) {
        super.init(frame: .zero)
        self.title = title
        self.subtitle = subtitle
        self.image = image ?? UIImage(named: "firstOnboarding")!
        self.buttonView.isHidden = !showButton
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(titleView)
        self.addSubview(subtitleView)
        self.addSubview(buttonView)
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 218),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            titleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 24),
            subtitleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            buttonView.topAnchor.constraint(equalTo: subtitleView.bottomAnchor, constant: 74),
            buttonView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 51),
            buttonView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAdditionalConfiguration() {
        subtitleView.numberOfLines = 0
        subtitleView.font = .systemFont(ofSize: 20)
        
        titleView.numberOfLines = 0
        titleView.font = .boldSystemFont(ofSize: 28)
        
        imageView.contentMode = .scaleAspectFill
        self.backgroundColor = .white
        
        buttonView.setTitle("Definir minha rotina", for: .normal)
        buttonView.backgroundColor = .orange
        buttonView.titleLabel?.font = .systemFont(ofSize: 20)
        buttonView.titleLabel?.textColor = .black
        buttonView.layer.cornerRadius = 10
        
    }
}
