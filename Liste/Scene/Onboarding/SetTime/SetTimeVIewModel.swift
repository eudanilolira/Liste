//
//  SetTimeViewModel.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import UIKit
import CoreData

class SetTimeViewModel {
    typealias Route = OnboardingCoordinator.Route
    weak var coordinator: OnboardingCoordinator?
    var user: User?
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        user = UserManager.shared.getUser()
    }
    
    func showNextPage() {
        let nextPage = coordinator?.routine?.nextRoutine()
        
        switch nextPage {
        case .work:
            coordinator?.navigate(to: .setWorkTime)
        case .study:
            coordinator?.navigate(to: .setStudyTime)
        case .sports:
            coordinator?.navigate(to: .setSportsTime)
        case .fun:
            coordinator?.navigate(to: .setFunTime)
        default:
            coordinator?.navigate(to: .allReady)
        }
    }
    
    func save(work: Int16? = nil, sleep: Int16? = nil, fun: Int16? = nil, sports: Int16? = nil, study: Int16? = nil) {
        self.user = UserManager.shared.create(sleep: sleep,
                                              work: work,
                                              fun: fun,
                                              sports: sports,
                                              study: study)
    }
}
