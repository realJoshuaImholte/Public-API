//MARK: Extension - String
extension String {
    
    //MARK: Function - Simple string nomenclature
    func color() -> UIColor {
        switch self {
            case "white":
                return .white
            case "lightgray":
                return .lightGray
            case "gray":
                return .gray
            case "darkgray":
                return .darkGray
            case "black":
                return .black
            case "yellow":
                return .systemYellow
            case "orange":
                return .systemOrange
            case "pink":
                return .systemPink
            case "red":
                return .systemRed
            case "blue":
                return .systemBlue
            case "teal":
                return .systemTeal
            case "indigo":
                return .systemIndigo
            case "purple":
                return .systemPurple
            case "green":
                return .systemGreen
            default:
                return .white
        }
    }
    
    //MARK: Function - String representation of a Boolean value
    func boolean() -> Bool {
        if (self == "true") {
            return true
        } else {
            return false
        }
    }
    
    //MARK: Function - Gets the current date
    func getDate(with format: String? = "MM-dd-yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)!
    }
    
    //MARK: Function - Prepare a phone number by stripping it of additional characters
    func prepareNumber() -> String {
        var returnNumber: String = self
        
        if (returnNumber.hasPrefix("+") || returnNumber.hasPrefix("1") || returnNumber.hasPrefix("+1")) {
            returnNumber = String(returnNumber.suffix(10))
        }
        
        if (returnNumber.contains("-")) {
            returnNumber = returnNumber.replacingOccurrences(of: "-", with: "")
        }
        
        return returnNumber
    }
    
    
    
    //MARK: Function - Call a phone number
    func call() {
        let formattedNum = self.formatNumber(type: .Calling)
        
        if let phoneCallURL = URL(string: "tel://\(formattedNum)") {
            let application: UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(
                    phoneCallURL,
                    options: [:],
                    completionHandler: nil
                )
            }
        }
    }
    
    
    
    //MARK: Function - Message a phone number
    func message(currentController: UIViewController) -> (result: Bool, cont: MFMessageComposeViewController) {
        let formattedNum = self.formatNumber(type: .Calling)
        let controller = MFMessageComposeViewController()
        var result: Bool!
        
        if (MFMessageComposeViewController.canSendText()) {
            controller.messageComposeDelegate = currentController as? MFMessageComposeViewControllerDelegate
            controller.recipients = [formattedNum]
            controller.body = ""
            
            result = true
        } else {
            result = false
        }
        
        return (result,controller)
    }
    
    
    
    //MARK: Function - Email
    func email(currentController: UIViewController, emails: [String]) -> (result: Bool, cont: MFMailComposeViewController) {
        let controller = MFMailComposeViewController()
        var result: Bool!
        
        if (MFMailComposeViewController.canSendMail()) {
            controller.mailComposeDelegate = currentController as? MFMailComposeViewControllerDelegate
            controller.setToRecipients(emails)
            controller.setMessageBody("", isHTML: false)
            
            result = true
        } else {
            result = false
        }
        
        return (result,controller)
    }
    
    
    
    //MARK: Function - Checks to see if emailaddress is valid
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
}
