//MARK: Modules
import Foundation
import UIKit



//MARK: Extension - UIView
extension UIView {
    
    //MARK: Function - Capture Image Data from UIView
    func captureImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return image
    }
    
    //MARK: Function - Round UIView's
    func round(radius: CGFloat = 12, masks: Bool = false, dimensions: CGSize = CGSize(width: 1.0, height: 1.0), strength: Float = 0.25) {
        self.layer.cornerRadius = radius
        self.layer.shadowRadius = radius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = dimensions
        self.layer.shadowOpacity = strength
        self.layer.masksToBounds = masks
    }
    
    //MARK: Function - Animate In UIView
    func animateIn(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: nil)
    }
    
    //MARK: Function - Animate In UIView
    func animateOut(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: nil)
    }
    
    //MARK: Function - Pop In UIView
    func popIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.1) {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    //MARK: Function - Pop Out UIView
    func popOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.1, isRemoving: Bool) {
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { _ in
            if (isRemoving) {
                self.removeFromSuperview()
            }
        })
    }
    
    //MARK: Function - Bounce UIView
    func bounce() {
        UIView.animate(withDuration: 0.5, delay: 1.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.transform = CGAffineTransform.identity
            },
            completion: nil)
        })
    }
    
    //MARK: Function - Get NIB from class name; useful for loading custom views
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}

