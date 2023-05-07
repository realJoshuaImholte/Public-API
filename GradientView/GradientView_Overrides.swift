//
//  GradientView_Overrides.swift
//  Olivia's Countdown App
//
//  Created by Joshua Imholte on 2/22/23.
//

import Foundation
import UIKit



//MARK: GradientView - Overrides
extension GradientView {
    
    //MARK: Override - layerClass
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    //MARK: Override - traitCollectionDidChange
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updatePoints()
        updateLocations()
        updateColors()
    }
    
}
