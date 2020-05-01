//
//  HomeVC.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 4/30/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit
import MaterialComponents


class HomeVC: UIViewController {
    
    
    
    let easyDifficultyButton: MDCRaisedButton = {
        let b = MDCRaisedButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Easy", for: .normal)
        b.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.137254902, blue: 1, alpha: 1)
        return b
    }()
    
    let mediumDifficultyButton: MDCRaisedButton = {
        let b = MDCRaisedButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Medium", for: .normal)
        b.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.137254902, blue: 1, alpha: 1)
        return b
    }()
    
    let hardDifficultyButton: MDCRaisedButton = {
        let b = MDCRaisedButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Hard", for: .normal)
        b.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.137254902, blue: 1, alpha: 1)
        return b
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.alignment = .center

        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Color Train"
        titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
        titleLabel.underline()
        
        return titleLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
        self.view.backgroundColor = .white
        stackView.addArrangedSubview(easyDifficultyButton)
        stackView.addArrangedSubview(mediumDifficultyButton)
        stackView.addArrangedSubview(hardDifficultyButton)
        self.view.addSubview(titleLabel)

        setupView()
        
        
    }
    
    
    
    
    func setupView() {
        
        

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.30),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)


        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        ])
        

    }
    
}


