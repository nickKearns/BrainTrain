//
//  ViewController.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 4/15/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit
import MaterialComponents

class HomeVC: UIViewController {
    
    
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(self.score)"
        }
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.backgroundColor = .white
        scrollView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return scrollView
    }()
    
    
    
    let scoreLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 20)
        l.text = "Score: 0"
        l.sizeToFit()
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 20)
        l.text = "Time:"
        l.sizeToFit()
        return l
    }()
    
    
    let colorLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 30)
        l.text = "Placeholder"
        l.textAlignment = .center
        return l
    }()
    
    let wordLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 30)
        l.text = "Placeholder"
        l.textAlignment = .center
        return l
    }()
    
    
    let yesButton: MDCFloatingButton = {
        let yesButton = MDCFloatingButton(shape: MDCFloatingButtonShape.default)
        yesButton.mode = .normal
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        yesButton.setImage(UIImage(named: "checkmark"), for: .normal)
        yesButton.backgroundColor = .white
        
        return yesButton
    }()
    
    
    let noButton: MDCFloatingButton = {
        let noButton = MDCFloatingButton(shape: MDCFloatingButtonShape.default)
        noButton.mode = .normal
        noButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.setImage(UIImage(named: "no"), for: .normal)
        noButton.backgroundColor = .white
        
        return noButton
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.tintColor = .black
        scrollView.backgroundColor = .white
        
        generateStep()
        
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(scoreLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(wordLabel)
        scrollView.addSubview(yesButton)
        scrollView.addSubview(noButton)
        
        
        
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["scrollView" : scrollView])
        )
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["scrollView" : scrollView])
        )
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100),
            scoreLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            timeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100),
            timeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25)
            
        ])
        
        NSLayoutConstraint.activate([
            colorLabel.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -100),
            colorLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100),
            wordLabel.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -100),
            wordLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            yesButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100),
            yesButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 75),
            noButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100),
            noButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 75)
        ])
        
        
        
        
    }
    
    
    func generateStep() {
        
    }
    
    
}

