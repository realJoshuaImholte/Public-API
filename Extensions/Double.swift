//MARK: Extension - Double
extension Double {
    
    //MARK: Function - Rounds Double
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
