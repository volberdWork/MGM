import UIKit
import SnapKit
import AudioToolbox
import MessageUI


class SettingsViewController: UIViewController {
    
    @IBOutlet var onOffSwitch: UISwitch!
    @IBOutlet var centralView: UIView!
    @IBOutlet var setButtons: [UIButton]!
    @IBOutlet var notificationsView: UIView!
    @IBOutlet var notificationSwitch: UISwitch!
    
    @IBOutlet var vibrationView: UIView!
    var userSettingsVibration = UserDefaults.standard
    let onOffKey = "onOffKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkVibrationState()
        configure()
        
    }
    
    
    private func configure(){
        notificationsView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.height.equalTo(heightForButtons())
        }
        self.title = "Settings"
        notificationsView.layer.borderWidth = 0.2
        notificationsView.layer.borderColor = CGColor(red: 0.867, green: 0.857, blue: 0.894, alpha: 1)
        vibrationView.layer.borderWidth = 0.2
        vibrationView.layer.borderColor = CGColor(red: 0.867, green: 0.857, blue: 0.894, alpha: 1)
        
        for i in setButtons{
            i.contentHorizontalAlignment = .left
            i.titleLabel?.font = UIFont(name: "System", size: 20)
            i.layer.borderWidth = 0.2
            i.layer.borderColor = CGColor(red: 0.867, green: 0.857, blue: 0.894, alpha: 1)
        }
        
        
        
    }
    
    
    func checkVibrationState(){
        if (userSettingsVibration.bool(forKey: onOffKey)){
            onOffSwitch.setOn(true, animated: false)
            
        } else{
            onOffSwitch.setOn(false, animated: false)
            
        }
    }
    
    @IBAction func shareAppPressed(_ sender: UIButton) {
        share(sender: UIView())
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (onOffSwitch.isOn){
            userSettingsVibration.set(true, forKey: onOffKey)
        }else{
            userSettingsVibration.set(false , forKey: onOffKey)
        }
        
    }
    
    @IBAction func writeToUsPressed(_ sender: UIButton) {
        openMessageWindow()
    }
    
    func heightForButtons()->CGFloat{
        centralView.frame.height / 20
    }
    
    @objc func share(sender:UIView){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare = "Check out my app"
        
        if let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") {//Enter link to your app here
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }    }
    
    
}



extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    //create converastional window
    func openMessageWindow() {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail Service is NOT available")
            
            let errorController = UIAlertController(title: "Dear User", message: "Sorry, buy Write To Us Service is temporarily unavailable. Please Try Again Later.", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            errorController.addAction(okAction)
            present(errorController, animated: true)
            
            return
            
        } else {
            
            print("Mail Service IS working")
            
            let composeController = MFMailComposeViewController()
            composeController.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            composeController.setToRecipients(["stakeYourSkillsFeedback@gmail.com"])
            composeController.setSubject("Message Subject")
            composeController.setMessageBody("Message content", isHTML: false)
            
            self.present(composeController, animated: true, completion: nil)
            
        }
        
        
        
        
        
    }
}
