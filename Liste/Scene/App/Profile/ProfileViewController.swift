//
//  ProfileViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    var didSendEventClosure: ((ProfileViewController.Event) -> Void)?
}

extension ProfileViewController {
    enum Event {
        case profile
    }
}
