//
//  GameVC.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 4/15/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit
import MaterialComponents

class GameVC: UIViewController {
    
    
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(self.score)"
        }
    }
    
    
    var colorInstance = ColorInstance()
    
    var timer = Timer()
    var timeRemaining = 10 {
        didSet {
            timeLabel.text = "Time Left: \(self.timeRemaining)"
        }
    }

    
    
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.isScrollEnabled = false
        return s
    }()
    
    
    let scoreLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 20)
        l.textColor = .white
        l.text = "Score: 0"
        l.sizeToFit()
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 20)
        l.textColor = .white
        l.text = "Time:"
        l.sizeToFit()
        return l
    }()
    
    
    let colorLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 60)
        l.text = "Placeholder"
        l.makeOutLine(oulineColor: .black, foregroundColor: .white)
        l.textAlignment = .center
        
        return l
    }()
    
    let wordLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir Heavy", size: 60)
        l.text = "Placeholder"
        l.textAlignment = .center
        l.makeOutLine(oulineColor: .black, foregroundColor: .white)
        return l
    }()
    
    
    let yesButton: MDCFloatingButton = {
        let yesButton = MDCFloatingButton(shape: MDCFloatingButtonShape.default)
        yesButton.mode = .normal
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        yesButton.setImage(UIImage(named: "checkmark"), for: .normal)
        yesButton.backgroundColor = .blue
        
        return yesButton
    }()
    
    
    let noButton: MDCFloatingButton = {
        let noButton = MDCFloatingButton(shape: MDCFloatingButtonShape.default)
        noButton.mode = .normal
        noButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.setImage(UIImage(named: "no"), for: .normal)
        noButton.backgroundColor = .red
        
        return noButton
    }()
    
    let startButton: MDCRaisedButton = {
        let startButton = MDCRaisedButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .blue
        
        return startButton
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        view.tintColor = .black
        
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.insertSublayer(gradient, at: 0)
        
        scrollView.layer.insertSublayer(gradient, at: 0)
//        scrollView.backgroundColor = .black
        
        //        generateStep()
        
        self.view.addSubview(scrollView)
        //MARK: SETTING UP CONSTRAINTS
        
        scrollView.addSubview(scoreLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(wordLabel)
        scrollView.addSubview(yesButton)
        scrollView.addSubview(noButton)
        scrollView.addSubview(startButton)
        noButton.isEnabled = false
        yesButton.isEnabled = false
        
        
        
        
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
            scoreLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150),
            timeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100),
            timeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150)
            
            
            
            
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
        
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: noButton.bottomAnchor, constant: 150)
            
            
        ])
        
        
        
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        
        updateLabels()
        
    }
    
    
    //MARK: OBJC FUNCTIONS
    
    @objc func noButtonTapped() {
        if colorsMatch() {
            updateLabels()
            endGame()
        }
        else {
            score += 10
            timeRemaining = 10
            updateLabels()
        }
        
    }
    
    @objc func startButtonTapped() {

        yesButton.isEnabled = true
        noButton.isEnabled = true
        startTimer()
    }
    
    @objc func yesButtonTapped() {
        if colorsMatch() {
            score += 10
            timeRemaining = 10
            updateLabels()
        }
        else {
            updateLabels()
            endGame()
        }
    }
    
    
    //MARK: LOGIC FUNCTIONS
    
    
    func colorsMatch() -> Bool {
        
        //return a bool, true if the colorWordLabel text matches the string version of the UIColor of the second word
        
        let colorOfLabel =  colorInstance.UIColorToString(color: colorLabel.textColor)
        //        print(colorOfLabel)
        //        print(colorWordLabel.text!)
        return colorOfLabel == wordLabel.text!
    }
    
   
    
    func endGame() {
        let gameOverVC = GameOverVC()
        gameOverVC.score = self.score
        self.navigationController?.pushViewController(gameOverVC, animated: true)
    }
    
    
    func getRandomColor() -> Color {
        //get a random color from the Color enum and return it
        return Color.allCases.randomElement()!
    }

    
    
    func updateLabels() {
        
        
        
        
        let colorText = colorInstance.colorToString(color: getRandomColor())
        let actualColorText = colorInstance.colorToString(color: getRandomColor())
        let actualColor = colorInstance.colorToUIColor(color: getRandomColor())
        
        
        
        
        colorLabel.textColor = actualColor
        colorLabel.text = actualColorText
        wordLabel.text = colorText
        wordLabel.textColor = colorInstance.colorToUIColor(color: getRandomColor())
        //        }
    }
    
    
    
    
    //MARK: Time Manipulation
    
    func startTimer() {
           //ACTION: create the timer, selector should be runTimer()
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
       }
    

    
    
    @objc func runTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            setTimeLabel()
        } else {
            timer.invalidate()
            endGame()
            
        }
    }
    
    func setTimeLabel() {
        timeLabel.text = "Time Left: \(self.timeRemaining)"
    }
    
}




//Taken from a medium article
//https://medium.com/@nimjea/custom-label-effects-in-swift-4-69ec12ba2178
extension UILabel{
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -2.0,
            NSAttributedString.Key.font : font ?? UIFont.systemFontSize
            ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(   NSAttributedString.Key.underlineStyle,
                                             value: NSUnderlineStyle.single.rawValue,
                                             range: NSRange(location: 0,
                                                            length: attributedString.length))
            attributedText = attributedString
        }
    }
}
