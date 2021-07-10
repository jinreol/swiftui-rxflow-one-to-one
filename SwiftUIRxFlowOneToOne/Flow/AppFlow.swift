//
//  AppFlow.swift
//  SwiftUIRxFlowOneToOne
//
//  Created by cow on 2021/07/08.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa 

class AppFlow: Flow {
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()
    
    var root: Presentable {
        return self.rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .listVC:
            return navigateToListVC()
        case .detailVC(let restaurant):
            return navigateToDetailVC(restaurant: restaurant)
        case .popVC:
            return .none
        }
    }
    
    private func navigateToListVC() -> FlowContributors {
        print("navigateToFirstVC")
        let viewController = ListViewController() 
        viewController.title = "Restaurants"
        self.rootViewController.pushViewController(viewController, animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToDetailVC(restaurant: Restaurant) -> FlowContributors {
        print("navigateToDetailVC")
        let viewController = DetailViewController(restaurant: restaurant) 
        viewController.title = "Restaurant Detail"
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
