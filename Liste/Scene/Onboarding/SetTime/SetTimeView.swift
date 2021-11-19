//
//  SetTimeView.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit
import MSCircularSlider

class SetTimeView: UIView, CodeView {
    
    //MARK: Properties
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let categoryLabel = UILabel()
    let nextButtonView = ButtonComponent(title: "Próximo")
    let slider = MSCircularSlider()
    let currentValueLabel = UILabel()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center
        stack.distribution = .equalSpacing

        return stack
    }()
    
    init(category: String) {
        categoryLabel.text = category
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.addSubview(nextButtonView)

        [titleLabel, subtitleLabel, categoryLabel, slider].forEach {
            stackView.addArrangedSubview($0)
        }
        
        slider.addSubview(currentValueLabel)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            //TODO: como adicionar constraint so no titulo?
            slider.widthAnchor.constraint(equalToConstant: 300),
            slider.heightAnchor.constraint(equalToConstant: 300),
            
            currentValueLabel.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            currentValueLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
        nextButtonView.setConstraints()
    }
    
    func setupAdditionalConfiguration() {
        titleLabel.text = "Conte sobre seu dia a dia"
        subtitleLabel.text = "Quanto tempo dedicará para:"
        titleLabel.textAlignment = .justified
        subtitleLabel.textAlignment = .justified
        
        categoryLabel.font = Font.category
        titleLabel.font = Font.title
        subtitleLabel.font = Font.subtitle
        
        categoryLabel.textColor = .raisinBlack
        titleLabel.textColor = .raisinBlack
        subtitleLabel.textColor = .raisinBlack
        
        self.backgroundColor = .white
        
        currentValueLabel.textColor = .raisinBlack
        currentValueLabel.font = Font.currentValue
        currentValueLabel.text = "\(Int(slider.currentValue))hrs"
        
        slider.currentValue = 1
        slider.maximumValue = 24
        slider.minimumValue = 1
        slider.maximumAngle = 300.0
        slider.filledColor = .tangerine
        slider.handleColor = .offWhite
        slider.handleType = MSCircularSliderHandleType.largeCircle
        slider.unfilledColor = .antiqueWhite
        slider.handleEnlargementPoints = 12
        slider.lineWidth = 20
    }
}
