//
//  Tabs.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation

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
            return "Ready"
        case .newTask:
            return "Steady"
        case .profile:
            return "Go"
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
    
    // Add tab icon selected / deselected color
    
    // etc
}
