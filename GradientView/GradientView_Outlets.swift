//
//  GradientView.swift
//  Olivia's Countdown App
//
//  Created by Joshua Imholte on 2/9/23.
//

import Foundation
import UIKit



//MARK: GradientView - O&V
@IBDesignable
public class GradientView: UIView {
    
    //MARK: CAGradientLayer
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    //MARK: UIColor
    @IBInspectable var startColor: UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor: UIColor = .white { didSet { updateColors() }}
    
    //MARK: Double
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation: Double =   0.95 { didSet { updateLocations() }}
    
    //MARK: Bool
    @IBInspectable var horizontalMode: Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode: Bool =  false { didSet { updatePoints() }}

}
