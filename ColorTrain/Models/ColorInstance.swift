//
//  ColorInstance.swift
//  ColorTrain
//
//  Created by Nicholas Kearns on 4/29/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit



enum Color: String, CaseIterable {
    case blue
    case red
    case yellow
    case green
    case purple
    case orange
    
    
}



enum Difficulty: Int {
    case easy
    case medium
    case hard
    
    var timeRemaining: Int {
        switch  self {
        case .easy:
            return 7
        case .medium:
            return 5
        case .hard:
            return 3
        }
    }
}


struct ColorInstance {
    
    func colorToUIColor(color: Color) -> UIColor {
        switch color {
        case .blue: return UIColor.blue
        case .red: return UIColor.red
        case .yellow: return UIColor.yellow
        case .green: return UIColor.green
        case .purple: return UIColor.purple
        case .orange: return UIColor.orange
        }
    }
    
    
    
    func UIColorToString(color: UIColor) -> String {
        switch color {
        case UIColor.blue: return "blue"
        case UIColor.red: return "red"
        case UIColor.yellow: return "yellow"
        case UIColor.green: return "green"
        case UIColor.purple: return "purple"
        case UIColor.orange: return "orange"
        default:
            return "no color"
            
        }
    }
    
    
    func colorToString(color: Color) -> String {
        switch color {
        case .blue: return "blue"
        case .red: return "red"
        case .yellow: return "yellow"
        case .green: return "green"
        case .purple: return "purple"
        case .orange: return "orange"
        }
    }
    
    
}

