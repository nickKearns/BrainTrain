//
//  GameOverVC.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 5/1/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents


class GameOverVC: UIViewController {
    
    var score: Int = 0
    
    
    let gameOverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text =  "Game Over"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Heavy", size: 50)
        
        
        return label
    }()
    
    let playAgainButton: MDCRaisedButton = {
       let playAgainButton = MDCRaisedButton()
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.setTitle("Play Again", for: .normal)
        playAgainButton.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.137254902, blue: 1, alpha: 1)
        
        return playAgainButton
    }()
    
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your Score:"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Heavy", size: 50)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        setupView()
        
        
    }
    
    
    func setupView() {
        view.addSubview(gameOverLabel)
        view.addSubview(scoreLabel)
        view.addSubview(playAgainButton)
        
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameOverLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor, constant: 50),
            
            playAgainButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -75)
        
        
        ])
        scoreLabel.text = "Your Score: \(self.score)"

    }
    
    
    
    
    
}
