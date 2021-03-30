//
//  SecondViewController.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController, UINavigationControllerDelegate {
    let button = UIButton(type: .system)
    
    let viewModel: SecondViewModel
    let textView = UITextView()
    let disposeBag = DisposeBag()
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(outupt: viewModel.transform(input: inputs))
        setUpView()
    }
    private var inputs: SecondViewModel.Input {
        return SecondViewModel.Input(buttonTrigger: button.rx.tap.asObservable())
    }
    
   private func bind(outupt: SecondViewModel.Output) {
        outupt.textView.drive(textView.rx.text).disposed(by: disposeBag)
    }

    
}
