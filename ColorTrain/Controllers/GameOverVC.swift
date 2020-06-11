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
        
        view.backgroundColor = .systemGray3
        
        setupView()
        
        
    }
    
    
    func setupView() {
        view.addSubview(gameOverLabel)
        view.addSubview(scoreLabel)
        view.addSubview(playAgainButton)
        
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameOverLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor, constant: 50),
            
            playAgainButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -75)
        
        
        ])
        scoreLabel.text = "Your Score: \(self.score)"
        
        playAgainButton.addTarget(self, action: #selector(playAgainButtonTapped), for: .touchUpInside)

    }
    
    
    @objc func playAgainButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
}
