//
//  AppCoordinator.swift
//  Liste
//
//  Created by Danilo on 15/11/21.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .tab
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        let pages: [Tabs] = [.home, .newTask, .profile]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = Tabs.home.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = true
        
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: Tabs) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageIcon(),
                                                     tag: page.pageOrderNumber())

        switch page {
        case .home:
            let readyVC = HomeViewController(viewModel: .init(coordinator: self))
            readyVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .home:
                    self?.selectPage(.newTask)
                }
            }
                        
            navController.pushViewController(readyVC, animated: true)

        case .newTask:
            let steadyVC = NewTaskViewController(viewModel: .init(coordinator: self))
            steadyVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .newTask:
                    self?.selectPage(.profile)
                }
            }
            navController.pushViewController(steadyVC, animated: true)
            
        case .profile:
            let goVC = ProfileViewController(viewModel: .init(coordinator: self))
            goVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .profile:
                    self?.finish()
                }
            }
            
            navController.pushViewController(goVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> Tabs {
        Tabs.init(index: tabBarController.selectedIndex)
    }

    func selectPage(_ page: Tabs) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        let page = Tabs.init(index: index)
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension AppCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
