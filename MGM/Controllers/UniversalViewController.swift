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
    
    
}
