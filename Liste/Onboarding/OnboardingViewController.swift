//
//  OnboardingViewController.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    var didSendEventClosure: ((OnboardingViewController.Event) -> Void)?
    var onboardingView: OnboardingView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
    }

    override func loadView() {
        view = onboardingView
    }
    init(title: String, subtitle: String, image: UIImage?) {
        self.onboardingView = OnboardingView(title: title,
                                             subtitle: subtitle,
                                             image: image)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Onboarding deinit")
    }
}

extension OnboardingViewController {
    enum Event {
        case login
    }
}
