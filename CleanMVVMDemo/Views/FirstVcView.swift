//
//  FirstVcView.swift
//  CleanMVVMDemo
//
//  Created by Victor Lee on 3/25/21.
//

import UIKit
import SnapKit

extension FirstViewController {
    func setUpView() {
        setupGoToSecondVcButton()
        setUpLabel()
        setUpButton()
        setUpTextField()
        view.backgroundColor = .red
        title = "First View"
        
    }
    
    func setUpButton() {
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitle("Tap Me", for: .normal)
        button.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    func setupGoToSecondVcButton() {
        view.addSubview(goToSecondVcButton)
        goToSecondVcButton.backgroundColor = .yellow
        goToSecondVcButton.setTitle("Next Vc", for: .normal)
        goToSecondVcButton.snp.makeConstraints { (make) in
            make.bottomMargin.equalTo(-50)
            make.leadingMargin.equalTo(25)
            make.trailingMargin.equalTo(-25)
            make.height.equalTo(50)
        }
    }
    
    func setUpTextField() {
        view.addSubview(textField)
        textField.backgroundColor = .white
        textField.snp.makeConstraints { (make) in
            make.topMargin.equalTo(25)
            make.leadingMargin.equalTo(25)
            make.trailingMargin.equalTo(-25)
            
        }
    }
    
    
    func setUpLabel() {
        view.addSubview(textLabel)
        textLabel.text =  "Hi"
        textLabel.numberOfLines = 0
        textLabel.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.topMargin.equalTo(50)
            make.width.equalTo(250)

        }
    }
}
