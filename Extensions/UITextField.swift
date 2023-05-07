//MARK: Extension - UITextField
extension UITextField {
    
    //MARK: Function - Updates Secure Text Entry Field and Button Associated
    func secure(_ secureButton: UIButton) {
        if (self.isSecureTextEntry) {
            self.isSecureTextEntry = false
            secureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            self.isSecureTextEntry = true
            secureButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
}
