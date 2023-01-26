import AudioToolbox
import Foundation
import UIKit
extension UIFont {
    
    class func applyRoundedFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let fontDescriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: fontDescriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}





extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}


extension UIDevice{
    static func onOffVibration(){
        if SettingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
    }
}
