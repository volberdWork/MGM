import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var remindersButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configure()
        
    }
    
    private func configure(){
        self.title = "Settings"
        remindersButton.contentHorizontalAlignment = .left
        remindersButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
    }

}
