import UIKit

class SavedTeamsAndPlayersVC: UIViewController {
    
    var data:[InfoBaseRealm] = []

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
       
    }


}


extension SavedTeamsAndPlayersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
