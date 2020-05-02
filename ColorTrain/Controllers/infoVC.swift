//
//  InfoVC.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 5/2/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents


class InfoVC: UIViewController {
    
    
    let infoCard: MDCCard = {
        let infoCard = MDCCard()
        infoCard.translatesAutoresizingMaskIntoConstraints = false
        infoCard.backgroundColor = .white
        return infoCard
    }()
    
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return infoLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        placeCard()
        
    }
    
    
    
    func placeCard() {
        view.addSubview(infoCard)
        NSLayoutConstraint.activate([
            infoCard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            infoCard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            infoCard.heightAnchor.constraint(equalToConstant: 50),
            infoCard.widthAnchor.constraint(equalToConstant: 50)
        
        
        
        ])
    }
    
    
    
    
    
}
