//
//  OnboardingViewController.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: Properties
    var mainView: OnboardingView
    var viewModel: OnboardingViewModel
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: OnboardingViewModel, title: String, subtitle: String, image: UIImage?, showButton: Bool) {
        self.viewModel = viewModel
        self.mainView = OnboardingView(
            subtitle: subtitle,
            title: title,
            image: image,
            showButton: showButton
        )
        super.init(nibName: nil, bundle: nil)
        
        self.setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))

        swipeGestureRecognizerRight.direction = .left
        mainView.addGestureRecognizer(swipeGestureRecognizerRight)
    }
    
    @objc func swipeRight(){
        viewModel.showNextPage()
    }
}
