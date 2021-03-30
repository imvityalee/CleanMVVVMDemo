//
//  AppDelegate.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import RxSwift
import RxFlow
import RxCocoa

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let disposeBag = DisposeBag()
    var coordinator: FlowCoordinator = FlowCoordinator()
    var appFlowStepper = FirstVcViewmodel()
    var mainFlow: AppFlow = AppFlow()
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
       
        
        
        Flows.whenReady(flow1: mainFlow){  (root) in
                    window.rootViewController = root
                    window.makeKeyAndVisible()
                }

        coordinator.coordinate(flow: mainFlow, with: appFlowStepper)

      return true
    }



}

