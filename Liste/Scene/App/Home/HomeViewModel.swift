//
//  HomeViewModel.swift
//  Liste
//
//  Created by Danilo on 16/11/21.
//

import Foundation

class HomeViewModel {
    weak var coordinator: AppCoordinator?
    var tasks: [Task]

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        tasks = TaskManager.shared.getAll()
    }
    
    func showNextPage() {
    }
}
