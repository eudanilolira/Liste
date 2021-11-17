//
//  OnboardingCoordinator.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import Foundation
import UIKit


class OnboardingCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .onboarding
    var routine: Routine?
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        navigate(to: .welcome)
    }
    
    func navigate(to route: Route) {
        switch route {
        case .welcome:
            createOnboardingIntroVC(
                title: "Bem vindo",
                subtitle: "Liste é um app para anotar suas tarefas de forma a respeitar sua rotina e suas necessidades",
                image: UIImage(named: "firstOnboarding"),
                nextPage: .knowYourPriorities,
                pageNumber: 0
            )
        case .knowYourPriorities:
            createOnboardingIntroVC(
                title: "Saiba suas prioridades",
                subtitle: "O app avalia quais as tarefas devem ser feitas antes para se evitar a correria e ansiedade.",
                image: UIImage(named: "secondOnboarding"),
                nextPage: .rememberToDeliver,
                pageNumber: 1
            )
        case .rememberToDeliver:
            createOnboardingIntroVC(
                title: "Não deixe de entregar",
                subtitle: "Cada task possui a possibilidade de ser entregável. Assim, você será lembrado com antecedência e evitará atrasos.",
                image: UIImage(named: "thirdOnboarding"),
                nextPage: .setRoutine,
                pageNumber: 2,
                showButton: true
            )
        case .setRoutine:
            let vc = SetRoutineViewController(viewModel: .init(coordinator: self))
            navigationController.pushViewController(vc, animated: true)
            
        case .setSleepTime:
            let vc = SetTimeViewController(
                viewModel: .init(coordinator: self), category: .sleep)
            navigationController.pushViewController(vc, animated: true)
        
        case .setFunTime:
            let vc = SetTimeViewController(
                viewModel: .init(coordinator: self), category: .fun)
            navigationController.pushViewController(vc, animated: true)
            
        case .setSportsTime:
            let vc = SetTimeViewController(
                viewModel: .init(coordinator: self), category: .sports)
            navigationController.pushViewController(vc, animated: true)
        
        case .setWorkTime:
            let vc = SetTimeViewController(
                viewModel: .init(coordinator: self), category: .work)
            navigationController.pushViewController(vc, animated: true)
            
        case .setStudyTime:
            let vc = SetTimeViewController(
                viewModel: .init(coordinator: self), category: .study)
            navigationController.pushViewController(vc, animated: true)

        case .allReady:
            createOnboardingIntroVC(
                title: "Estamos prontos!",
                subtitle: "Agora é só adicionar suas tasks e organizar sua rotina!",
                image: UIImage(named: "fourthOnboarding"),
                nextPage: .dismiss,
                showButton: true
            )
        
        case .dismiss:
            UserDefaults.standard.set(true, forKey: "didFinishOnboarding")
            self.finish()
        }
    }
}

extension OnboardingCoordinator {
    func createOnboardingIntroVC(title: String,
                                 subtitle: String,
                                 image: UIImage?,
                                 nextPage: Route, pageNumber: Int? = nil,
                                 showButton: Bool = false) {

        let onboardingVC = OnboardingViewController(
            viewModel: .init(coordinator: self, nextPage: nextPage),
            title: title,
            subtitle: subtitle,
            image: image,
            pageNumber: pageNumber,
            showButton: showButton
        )

        navigationController.pushViewController(onboardingVC, animated: true)
    }
}
extension OnboardingCoordinator {
    enum Route {
        case welcome
        case knowYourPriorities
        case rememberToDeliver
        case setRoutine
        case setSleepTime
        case setWorkTime
        case setStudyTime
        case setFunTime
        case setSportsTime
        case allReady
        case dismiss
    }
}
