//
//  HomeViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var didSendEventClosure: ((HomeViewController.Event) -> Void)?
}

extension HomeViewController {
    enum Event {
        case home
    }
}
