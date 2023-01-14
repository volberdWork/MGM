import UIKit
import SnapKit
class SettingsViewController: UIViewController {

    @IBOutlet var centralView: UIView!
    
    @IBOutlet var notificationsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configure()
        
    }
    
    private func configure(){
        notificationsView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.height.equalTo(heightForButtons())
        }
        
        
        
        
        
        
        
//        title = "Settings"
//        remindersButton.contentHorizontalAlignment = .left
//        remindersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
//        remindersButton.layer.borderWidth = 1
//        remindersButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//        remindersButton.layer.cornerRadius = 10
        
        
    }

    func heightForButtons()->CGFloat{
        centralView.frame.height / 20
    }
}
