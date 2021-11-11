//
//  SetTimeView.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit

class SetTimeView: UIView, CodeView {
    
    //MARK: Properties
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var categoryLabel = UILabel()
    var nextButtonView = ButtonComponent(title: "Próximo")

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center
        stack.distribution = .equalSpacing

        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.addSubview(nextButtonView)

        [titleLabel, subtitleLabel, categoryLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
        nextButtonView.setConstraints()
    }
    
    func setupAdditionalConfiguration() {
        categoryLabel.text = "Dormir"
        titleLabel.text = "Conte sobre seu dia a dia"
        subtitleLabel.text = "Quanto tempo dedicará para:"
        
        categoryLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.font = .boldSystemFont(ofSize: 28)
        subtitleLabel.font = .systemFont(ofSize: 24)
        
        categoryLabel.textColor = .black
        titleLabel.textColor = .black
        subtitleLabel.textColor = .black
        
        self.backgroundColor = .white
    }
}
