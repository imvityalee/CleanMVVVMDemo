//
//  SecondViewControllerViewmodel.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

final class SecondViewModel: ViewModelType, Stepper {
    var steps = PublishRelay<Step>()
    
    
    struct Input {
        
        let buttonTrigger: Observable<Void>
    }
    
    struct Output {
        let textView: Driver<String>
   
    }
    
    func transform(input: Input) -> Output {
        let button = input.buttonTrigger
            .flatMapLatest {
      NetworkManager.shared.getPosts(with: 1).asObservable() }
            .map { $0.title ?? "" }
            .asDriver(onErrorJustReturn: .init())
        return Output(textView: button)
    }
  

}
