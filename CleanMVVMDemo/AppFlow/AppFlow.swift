//
//  AppFlow.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import RxFlow
import UIKit


class AppFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    
    func navigate(to step: Step) -> FlowContributors {
        
        guard let step = step as? AppStep else {
            return FlowContributors.none
        }
            switch step {
        case .initial:
            return pushInitilVc()
        case .moveToSecondVc:
            return moveToSecondVc()
            
        }
    }
    
    private func moveToSecondVc() -> FlowContributors {
        let viewModel = SecondViewModel()
        let viewController = SecondViewController(viewModel: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
        
    }
    
    private func pushInitilVc() -> FlowContributors {
        let viewModel = FirstVcViewmodel()
        let viewController = FirstViewController(viewModel: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.stepper))
    }
    
}
