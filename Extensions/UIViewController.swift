//MARK: Modules
import Foundation
import UIKit



//MARK: Extension - UIViewController
extension UIViewController {
    
    //MARK: Function - Setup Controller
    func SetupController(_ style: UIUserInterfaceStyle = .light) {
        overrideUserInterfaceStyle = style
        self.hideKeyboardWhenSwipedDown()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: Function - Hide Keyboard When Tapped Around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //MARK: Function - Hide Keyboard When Swiped Down
    func hideKeyboardWhenSwipedDown() {
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        swipe.direction = .down
        swipe.cancelsTouchesInView = false
        view.addGestureRecognizer(swipe)
    }

    //MARK: Function - Dismiss Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: Function - Create Basic System Alert
    func BasicAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Function - Create Custom Alert
    func Alert(message: String, topConstraintConstant: CGFloat = 60, widthConstraintConstant: CGFloat = 80) {
        let alertView: AlertView = AlertView.fromNib()
        alertView.alpha = 0.0
        alertView.configureAlert(message: message)
        self.view.addSubview(alertView)
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: alertView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: -200)
        let horizontalConstraint = NSLayoutConstraint(item: alertView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: alertView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.bounds.width - widthConstraintConstant)
        let heightConstraint = NSLayoutConstraint(item: alertView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        self.view.addConstraints([topConstraint, horizontalConstraint, widthConstraint, heightConstraint])
        
        topConstraint.constant = topConstraintConstant
        UIView.animate(withDuration: 0.5, animations: {
            alertView.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: {_ in
            alertView.popOut(delay: 2.0, isRemoving: true)
        })
    
    }

}

