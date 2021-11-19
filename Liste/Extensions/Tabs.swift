//
//  Tabs.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation
import UIKit

enum Tabs {
    case home
    case newTask
    case profile

    init(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .newTask
        case 2:
            self = .profile
        default:
            self = .home
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        case .newTask:
            return "Nova tarefa"
        case .profile:
            return "Perfil"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .newTask:
            return 1
        case .profile:
            return 2
        }
    }

    // Add tab icon value
    func pageIcon() -> UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .newTask:
            return UIImage(systemName: "plus.circle.fill")!
        case .profile:
            return UIImage(systemName: "person")!
        }
    }
    // Add tab icon selected / deselected color
    
    // etc
}
