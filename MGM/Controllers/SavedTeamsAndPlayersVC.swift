import UIKit
import RealmSwift

class SavedTeamsAndPlayersVC: UIViewController {
    
    var data:[InfoTeamRealm] = []
    let realm = try? Realm()
    var realmArray: [InfoTeamRealm] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ButtonTableViewCell")
        configure()
        
        
        
        
        super.viewDidLoad()
        func configure(){
            tableView.backgroundColor = .clear
        }
        self.realmArray = []
        guard let infoMatchesResult = realm?.objects(InfoTeamRealm.self) else {return}
        for match in infoMatchesResult{
            self.realmArray.append(match)
        }
        if realmArray.count > 0{
            self.tableView.reloadData()
        } else{
            //            showAlertAction(title: "Sorry", message: "No data")
        }
    }
    
    
}


extension SavedTeamsAndPlayersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
