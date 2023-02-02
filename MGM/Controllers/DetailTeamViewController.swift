import UIKit
import RealmSwift

class DetailTeamViewController: UIViewController {
    let realm = try? Realm()
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    
    func saveToRealm(){
        
        let infoBaseRealm = InfoBaseRealm()
        
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
        }
    }
    
    
    func loadAllert(){
        let alert = UIAlertController(title: "Save Event", message: "For save tap ok", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.saveToRealm()
//            self.saveButton.setImage(UIImage(named: "savedStar"), for: .normal)
            
            UIDevice.onOffVibration()
        })
        alert.addAction(ok)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
            
        })
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            UIDevice.onOffVibration()
            self.present(alert, animated: true)
            
        })
    }
    
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    
}
