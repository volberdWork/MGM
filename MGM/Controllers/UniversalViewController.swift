import UIKit

class UniversalViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var array:[ButtonSet] = [ButtonSet(title: "Teams", imageName: "ssss"),
                             ButtonSet(title: "Players", imageName: "Events"),
                             ButtonSet(title: "Events", imageName: "ssss")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ButtonTableViewCell")
        configure()
    }
    func configure(){
        tableView.backgroundColor = .clear
    }
}

extension UniversalViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
        cell.configure(media: array[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch array[indexPath.row].title{
        case "Teams" : let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "SavedTeamsAndPlayersVC") as? SavedTeamsAndPlayersVC {
                navigationController?.pushViewController(vc, animated: true)
            }
                UIDevice.onOffVibration()
            case "Players" : let main = UIStoryboard(name: "Main", bundle: nil)
                if let vc = main.instantiateViewController(withIdentifier: "SavedTeamsAndPlayersVC") as? SavedTeamsAndPlayersVC {
                    navigationController?.pushViewController(vc, animated: true)
                }
                    UIDevice.onOffVibration()
        case "Events" : let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "RemindersViewController") as? RemindersViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
                UIDevice.onOffVibration()
        default:
            return
        }
        
            
            
        
    }
    
    
}
