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
    var currentValue: Int16 = 0
    var category: Category
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: SetTimeViewModel, category: Category) {
        self.category = category
        self.viewModel = viewModel
        self.mainView = SetTimeView(category: category.rawValue)
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
        switch category {
        case .sleep:
            viewModel.save(sleep: currentValue)
        case .work:
            viewModel.save(work: currentValue)
        case .sports:
            viewModel.save(sports: currentValue)
        case .fun:
            viewModel.save(fun: currentValue)
        case .study:
            viewModel.save(study: currentValue)
        }
        
        viewModel.showNextPage()
    }
    
    func circularSlider(_ slider: MSCircularSlider, valueChangedTo value: Double, fromUser: Bool) {
        let intValue = Int(round(value))
        currentValue = Int16(intValue)
        mainView.currentValueLabel.text = "\(intValue)hrs"
    }
}

enum Category: String {
    case sleep = "Dormir"
    case work = "Trabalhar"
    case sports = "Esportes"
    case fun = "Diversão"
    case study = "Estudo"
}
