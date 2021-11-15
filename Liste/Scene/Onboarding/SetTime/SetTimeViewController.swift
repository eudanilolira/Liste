//
//  SetTimeViewController.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit
import MSCircularSlider

class SetTimeViewController: UIViewController, MSCircularSliderDelegate, MSCircularSliderProtocol {
    
    //MARK: Properties
    let mainView: SetTimeView
    let viewModel: SetTimeViewModel
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: SetTimeViewModel, category: String) {
        self.viewModel = viewModel
        self.mainView = SetTimeView(category: category)
        super.init(nibName: nil, bundle: nil)
        
        self.mainView.slider.delegate = self
        self.setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
        mainView.nextButtonView.addTarget(self, action: #selector(showNextPage), for: .touchUpInside)
    }
    
    @objc func showNextPage() {
        viewModel.showNextPage()
    }
    
    func circularSlider(_ slider: MSCircularSlider, valueChangedTo value: Double, fromUser: Bool) {
        let intValue = Int(round(value))
        mainView.currentValueLabel.text = "\(intValue)hrs"
    }
}
