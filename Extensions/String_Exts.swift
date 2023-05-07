/* String */
extension String {
    
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
    
    func boolean() -> Bool {
        if (self == "true") {
            return true
        } else {
            return false
        }
    }
    
    func getDate(with format: String? = "MM-dd-yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)!
    }
    
    func formatNumber(with format: NumberFormat) -> String {
        if (self.contains("-")) {
            let number = self.split(separator: "-")
            let areaCode = number[0]
            let exCode = number[1]
            let final = number[2]
            
            switch format {
            case .Calling:
                return String(areaCode + exCode + final)
            case .Viewing:
                return String(areaCode + "-" + exCode + "-" + final)
            }
            
        } else {
            let areaCode = self.prefix(3)
            let suffix = self.suffix(7)
            let exCode = suffix.prefix(3)
            let final = suffix.suffix(4)
            
            switch format {
            case .Calling:
                return String(areaCode + exCode + final)
            case .Viewing:
                return String(areaCode) + "-" + String(exCode) + "-" + String(final)
            }
        }
    }
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
}
