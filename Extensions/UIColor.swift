//MARK: Modules
import Foundation
import UIKit



//MARK: Extension - UIColor
extension UIColor {
    
    //MARK: Function - Get RGBA from color space; used in creating oColor structures
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
