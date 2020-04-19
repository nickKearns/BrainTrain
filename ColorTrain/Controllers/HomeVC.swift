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
        l.text = "Score: 0"
        l.sizeToFit()
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Time:"
        l.sizeToFit()
        return l
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.tintColor = .black
        scrollView.backgroundColor = .white
        
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(scoreLabel)
        scrollView.addSubview(timeLabel)
        
        
        
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
        
    
        
        
    }
    
    
}

