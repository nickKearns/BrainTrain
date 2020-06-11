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
    
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textAlignment = .center
        
        infoLabel.text = "The name of the game is to match the name of the text on the left to the color of the text on the right."

        
        return infoLabel
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Color Train"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
        titleLabel.underline()
        
        return titleLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
        
        
//        let gradient = CAGradientLayer()
//
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
//        gradient.startPoint = CGPoint.zero
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.insertSublayer(gradient, at: 0)
        
        self.view.backgroundColor = .systemGray3
        
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
        
//        NSLayoutConstraint.activate([
//            infoLabel.topAnchor.constraint(equalTo: hardDifficultyButton.bottomAnchor, constant: 50),
//            infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//
//        ])
//
        
        easyDifficultyButton.addTarget(self, action: #selector(easyButtonTapped), for: .touchUpInside)
        mediumDifficultyButton.addTarget(self, action: #selector(mediumButtonTapped), for: .touchUpInside)
        hardDifficultyButton.addTarget(self, action: #selector(hardButtonTapped), for: .touchUpInside)

    }
    
    @objc func easyButtonTapped() {
        let gameVC = GameVC()
        gameVC.difficulty = .easy
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    @objc func mediumButtonTapped() {
        let gameVC = GameVC()
        gameVC.difficulty = .medium
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    @objc func hardButtonTapped() {
        let gameVC = GameVC()
        gameVC.difficulty = .hard
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    
}


