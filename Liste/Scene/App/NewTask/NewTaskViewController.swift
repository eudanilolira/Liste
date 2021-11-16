//
//  NewTaskViewController.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

class NewTaskViewController: UIViewController {
    var didSendEventClosure: ((NewTaskViewController.Event) -> Void)?
}

extension NewTaskViewController {
    enum Event {
        case newTask
    }
}
