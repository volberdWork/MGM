import UIKit
import RealmSwift
import Kingfisher
import Alamofire
class DetailTeamViewController: UIViewController {
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var secondCollectionView: UICollectionView!
    @IBOutlet var filterCollectionView: UICollectionView!
    @IBOutlet var logoTeamImage: UIImageView!
    @IBOutlet var countryTeamLabel: UILabel!
    @IBOutlet var teamNameLabel: UILabel!
    
    var araay : [Response] = []
//    var detaidData: [GetDetailTeam] = []
    var currentSelected:Int? = 0
    let filterArray = ["Team", "Players"]
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    var someData = ["ee","ee","erew","w34ed","3edft"]
    let testData = [
        
        ["FirstDown", "Total", "Passing", "Rushing", "From Penalties"],
        ["Plays", "Total"],
        ["Yards", "Total", "Yards per play"],
        ["Passing", "Totla", "Comp att", "Yards pre pass", "From Penalties", "Comp att", "Yards pre pass", "From Penalties"]
        
    ]
    var teamId = 0
    var teamName = ""
    var countryName = ""
    var playerName = ""
    var logoLink = ""
    
    let realm = try? Realm()
    var realmArray: [InfoTeamRealm] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamId)
        
        let urlIconTeamFirst = URL(string: logoLink)
        self.logoTeamImage.kf.setImage(with: urlIconTeamFirst)
        self.teamNameLabel.text = teamName
        self.filterCollectionView.backgroundColor = self.view.backgroundColor
        self.secondCollectionView.backgroundColor = self .view.backgroundColor
        self.countryTeamLabel.text = countryName
        realmObjectToArray()
        checkSavedButtonState()
    }
    
    func realmObjectToArray(){
        guard let infoMatchesResult = realm?.objects(InfoTeamRealm.self) else {return}
        for match in infoMatchesResult{
            self.realmArray.append(match)
        }
    }
    
    func checkSavedButtonState(){
        for i in realmArray{
            if i.teamId == self.teamId{
                self.saveButton.setImage(UIImage(named: "savedStar"), for: .normal)
                print(i.teamId)
            }
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
        loadAllert()
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
            filterCell.viewForLabel.backgroundColor = currentSelected == 0 ? UIColor.white : UIColor.clear
            filterCell.filterLabel.textColor = currentSelected == 0 ? UIColor.black : UIColor.white
            filterCell.viewForLabel.backgroundColor = currentSelected == indexPath.row ? UIColor.white : UIColor.clear
            filterCell.filterLabel.textColor = currentSelected == indexPath.row ? UIColor.black : UIColor.white
            
            return filterCell
        } else{
            let playerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
            
          
            return playerCell
        }
       
    }
    
   private func saveToRealm(){
        let infoTeamBaseRealm = InfoTeamRealm()
        infoTeamBaseRealm.teamId = teamId
        infoTeamBaseRealm.LogoLink = logoLink
        infoTeamBaseRealm.teamName = teamName
        try? self.realm?.write{
            self.realm?.add(infoTeamBaseRealm, update: .all)
        }
    }
    
    
}

extension DetailTeamViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        case filterCollectionView: UIDevice.onOffVibration()
            currentSelected = indexPath.row
            collectionView.reloadData()
            
            
        case secondCollectionView :  let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "PlayerDetailViewController") as? PlayerDetailViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
            
        default:
            return
        }
    }
}
