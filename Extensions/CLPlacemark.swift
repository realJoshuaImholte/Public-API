//MARK: Extension - CLPlacemark
extension CLPlacemark {
    
    //MARK: Variable - Street Name
    var StreetName: String? { thoroughfare }
    
    //MARK: Variable - Street Number
    var StreetNumber: String? { subThoroughfare }
    
    //MARK: Variable - City
    var City: String? { locality }
    
    //MARK: Variable - Neighborhood
    var Neighborhood: String? { subLocality }
    
    //MARK: Variable - State
    var State: String? { administrativeArea }
    
    //MARK: Variable - County
    var County: String? { subAdministrativeArea }
    
    //MARK: Variable - ZipCode
    var ZipCode: String? { postalCode }
    
}
