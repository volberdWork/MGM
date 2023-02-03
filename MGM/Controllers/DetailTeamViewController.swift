import UIKit
import RealmSwift
import Kingfisher
class DetailTeamViewController: UIViewController {
    
    @IBOutlet var secondCollectionView: UICollectionView!
    @IBOutlet var filterCollectionView: UICollectionView!
    @IBOutlet var logoTeamImage: UIImageView!
    @IBOutlet var countryTeamLabel: UILabel!
    @IBOutlet var teamNameLabel: UILabel!
    
    let filterArray = ["Team", "Players"]
    
    var someData = ["ee","ee","erew","w34ed","3edft"]
    let testData = [
        
        ["FirstDown", "Total", "Passing", "Rushing", "From Penalties"],
        ["Plays", "Total"],
        ["Yards", "Total", "Yards per play"],
        ["Passing", "Totla", "Comp att", "Yards pre pass", "From Penalties", "Comp att", "Yards pre pass", "From Penalties"]
        
    ]
    var teamId = ""
    var teamName = ""
    var countryName = ""
    var playerName = ""
    var logoLink = ""
    
    
    let realm = try? Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlIconTeamFirst = URL(string: logoLink)
        self.logoTeamImage.kf.setImage(with: urlIconTeamFirst)
        self.teamNameLabel.text = teamName
        self.filterCollectionView.backgroundColor = self.view.backgroundColor
        self.secondCollectionView.backgroundColor = self .view.backgroundColor
    }
    
    
    func saveToRealm(){
        
        let infoTeam = InfoTeamRealm()
        infoTeam.teamName = self.teamName
        infoTeam.LogoLink = self.logoLink
        
        
        try? self.realm?.write{
            self.realm?.add(infoTeam, update: .all)
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



extension DetailTeamViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case filterCollectionView : return filterArray.count
        case secondCollectionView : return 10
        default:
            return 1
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView{
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = filterArray[indexPath.row]
            
            return filterCell
        } else{
            let playerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
            
          
            return playerCell
        }
       
    }
    
    
}
