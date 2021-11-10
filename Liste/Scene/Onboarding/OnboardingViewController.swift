//
//  OnboardingViewController.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    var didSendEventClosure: ((OnboardingViewController.Event) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = OnboardingView()
        
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
