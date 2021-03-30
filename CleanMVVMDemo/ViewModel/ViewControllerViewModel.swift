//
//  ViewControllerViewModel.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

final class FirstVcViewmodel: ViewModelType, Stepper {
    var steps = PublishRelay<Step>.init()
    
    
    var initialStep: Step {
        AppStep.initial
    }
    
    struct Input {
        let title: Observable<String>
        let validate: Observable<Void>
        let nextVcTrigger: Observable<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
        let next: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        
        
        let greeting = input.validate
            
            .withLatestFrom(input.title)
            .map {  title  in
                return "It is title \(title)"
            }
            .startWith("")
            .asDriver(onErrorJustReturn: "")
        let loginButton = input.nextVcTrigger
            .do(onNext: goNext)
            .asDriver(onErrorJustReturn: ())
        
        
        return Output(greeting: greeting, next: loginButton)
        
    }
    
    public func goNext() {
        self.steps.accept(AppStep.moveToSecondVc)
        
    }
    
}
