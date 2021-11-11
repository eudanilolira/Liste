//
//  OnboardingViewModel.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import Foundation

class OnboardingViewModel {
    typealias Route = OnboardingCoordinator.Route

    weak var coordinator: OnboardingCoordinator?
    let page: Route
    
    init(coordinator: OnboardingCoordinator, nextPage: Route) {
        self.coordinator = coordinator
        self.page = nextPage
    }
    
    func showNextPage() {
        coordinator?.navigate(to: page)
    }
}
