//
//  ProfileViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: Properties
    var mainView: ProfileView
    var viewModel: ProfileViewModel
    var didSendEventClosure: ((Event) -> Void)?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    //MARK: Initalizers
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        self.mainView = ProfileView()
        super.init(nibName: nil, bundle: nil)
        self.setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActions() {
    }
    
}

extension ProfileViewController {
    enum Event {
        case profile
    }
}
