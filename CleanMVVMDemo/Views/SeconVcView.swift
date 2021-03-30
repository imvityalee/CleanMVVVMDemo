//
//  SeconVcView.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit


extension SecondViewController {
    
    
    func setUpView() {
        setUpTextView()
        setupButton()
        view.backgroundColor = .cyan
    }
    
   private func setUpTextView() {
        
        view.addSubview(textView)
        textView.text = "Text from BackEnd"
        textView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(250)
        }
    }
    
   private func setupButton() {
   
        view.addSubview(button)
        button.backgroundColor = .magenta
        button.tintColor = .white
        button.setTitle("Data from Backend", for: .normal)
        button.snp.makeConstraints { (make) in
            make.bottomMargin.equalTo(-50)
            make.leadingMargin.equalTo(25)
            make.trailingMargin.equalTo(-25)
            make.height.equalTo(50)
    }
    }
}
