//MARK: Modules
import Foundation
import UIKit



//MARK: Extension - UIDevice
extension UIDevice {
    
    //MARK: Function - Checks to see if iPhone has a dynamic island or not
    func hasDynamicIsland() -> Bool {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            let nameSimulator = simulatorModelIdentifier
            return nameSimulator == "iPhone15,2" || nameSimulator == "iPhone15,3" ? true : false
        }
        
        var sysinfo = utsname()
        uname(&sysinfo) // ignore
        let name =  String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        return name == "iPhone15,2" || name == "iPhone15,3" ? true : false
    }
}
