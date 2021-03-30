//
//  ViewController.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxFlow

class FirstViewController: UIViewController, UINavigationControllerDelegate{
    var button = UIButton(type: .system)
    var textField = UITextField()
    var textLabel = UILabel()
    var goToSecondVcButton = UIButton(type: .system)
    
    private let disposeBag = DisposeBag()
    
    let viewModel: FirstVcViewmodel
    
    init(viewModel: FirstVcViewmodel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var stepper: Stepper {
        viewModel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        bind(outupt: viewModel.transform(input: inputs))
    }
    
    
    private var inputs: FirstVcViewmodel.Input {
        return FirstVcViewmodel.Input(title: textField.rx.text.orEmpty.asObservable(), validate: button.rx.tap.asObservable(), nextVcTrigger: goToSecondVcButton.rx.tap.asObservable())
    }
    
   private func bind(outupt: FirstVcViewmodel.Output) {
        outupt.next.drive().disposed(by: disposeBag)
        outupt.greeting.drive(textLabel.rx.text).disposed(by: disposeBag)
    }
    

    
}


