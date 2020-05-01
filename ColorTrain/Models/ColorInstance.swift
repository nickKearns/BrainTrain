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
    case black
    case purple
    case orange
    
    
}



struct ColorInstance {

    func colorToUIColor(color: Color) -> UIColor {
        switch color {
        case .blue: return UIColor.blue
        case .red: return UIColor.red
        case .yellow: return UIColor.yellow
        case .green: return UIColor.green
        case .black: return UIColor.black
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
        case UIColor.black: return "black"
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
        case .black: return "black"
        case .purple: return "purple"
        case .orange: return "orange"
        }
    }
    
    
}
