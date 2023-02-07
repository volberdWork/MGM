import UIKit
import RealmSwift
import Alamofire


class DetailViewController: UIViewController {
    
    let filterData = ["Game", "Events", "Team Statistics", "Players Statistics"]
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
    var currentSelected:Int? = 0
    var dasd: [StatResponse] = []
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    
    
    @IBOutlet var saveButton: UIButton!
    
    var data : [Response] = []
    let realm = try? Realm()
    var realmArray: [InfoBaseRealm] = []
    
    let testData = [
        
        ["FirstDown", "Total", "Passing", "Rushing", "From Penalties"],
        ["Plays", "Total"],
        ["Yards", "Total", "Yards per play"],
        ["Passing", "Totla", "Comp att", "Yards pre pass", "From Penalties", "Comp att", "Yards pre pass", "From Penalties"]
        
    ]
    
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.backgroundColor = .clear
        
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.backgroundColor = .clear
        
        configureView()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(homeTapped(tapGestureRecognizer:)))
        homeLogo.isUserInteractionEnabled = true
        homeLogo.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(awayTaped(tapGestureRecognizer:)))
        awayLogo.isUserInteractionEnabled = true
        awayLogo.addGestureRecognizer(tapGestureRecognizer1)
        
        loadLiveBase()
        realmObjectToArray()
        checkSavedButtonState()
      
        
        
    }
    
    func realmObjectToArray(){
        guard let infoMatchesResult = realm?.objects(InfoBaseRealm.self) else {return}
        for match in infoMatchesResult{
            self.realmArray.append(match)
        }
    }
    
   private func checkSavedButtonState(){
        for i in realmArray{
            if i.gameId == data[0].fixture?.id!{
                self.saveButton.setImage(UIImage(named: "savedStar"), for: .normal)
            }
        }
    }
    func loadLiveBase(){
        let url = "https://v3.football.api-sports.io/teams?id=1462"
        
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            
            do {
                let data = try decoder.decode(TeamInfo.self, from: respponseData)
                print(data.response?.count ?? 0)
                print(data.response?[0].team?.country ?? "")
                self.dasd = data.response!
                
                
            } catch {
                print("Щось пішло не так")
            }
        }
    }
  
    
  

    @objc func homeTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "DetailTeamViewController") as? DetailTeamViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.teamName = data[0].teams?.home?.name ?? ""
            vc.logoLink = data[0].teams?.home?.logo ?? ""
            vc.teamId = data[0].teams?.home?.id ?? 0
        }
    }
    @objc func awayTaped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "DetailTeamViewController") as? DetailTeamViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.teamName = data[0].teams?.away?.name ?? "No data"
            vc.logoLink = data[0].teams?.away?.logo ?? ""
            vc.teamId = data[0].teams?.away?.id ?? 0
            
        }
    }
    func configureView(){
        dateLabel.text = changeDateFormat(dateString: (data[0].fixture?.date ?? ""), fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
        homeName.text = data[0].teams?.home?.name ?? ""
        awayName.text = data[0].teams?.away?.name ?? ""
        statusLabel.text = String.getStatus(response: data[0])
        let urlIconTeamFirst = URL(string: (data[0].teams?.home?.logo ?? ""))
        let urlIconTeamSecond = URL(string: (data[0].teams?.away?.logo ?? ""))
        homeLogo.kf.setImage(with: urlIconTeamFirst)
        awayLogo.kf.setImage(with: urlIconTeamSecond)
        
    }
    
    func loadAllert(){
        let alert = UIAlertController(title: "Save Event", message: "For save tap ok", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.saveToRealm()
            self.saveButton.setImage(UIImage(named: "savedStar"), for: .normal)
            
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
    
  private func saveToRealm(){
        
        let infoBaseRealm = InfoBaseRealm()
        infoBaseRealm.gameId = data[0].fixture?.id ?? 0
        infoBaseRealm.awayName = data[0].teams?.away?.name ?? ""
        infoBaseRealm.homaName = data[0].teams?.home?.name ?? ""
        infoBaseRealm.date = data[0].fixture?.date ?? ""
        infoBaseRealm.awayLogoLink = data[0].teams?.away?.logo ?? ""
        infoBaseRealm.homeLogoLink = data[0].teams?.home?.logo ?? ""
        
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
        }
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        loadAllert()
        print("OKKK")
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     
        
        switch collectionView{
        case filterCollectionView : UIDevice.onOffVibration()
            currentSelected = indexPath.row
            collectionView.reloadData()
            
        default:
            return
        }
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == filterCollectionView {
            return 1
        } else {
            return testData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == filterCollectionView {
            return filterData.count
        } else {
            return testData[section].count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case filterCollectionView : let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = filterData[indexPath.row]
            filterCell.viewForLabel.backgroundColor = currentSelected == 0 ? UIColor.white : UIColor.clear
            filterCell.filterLabel.textColor = currentSelected == 0 ? UIColor.black : UIColor.white
            filterCell.viewForLabel.backgroundColor = currentSelected == indexPath.row ? UIColor.white : UIColor.clear
            filterCell.filterLabel.textColor = currentSelected == indexPath.row ? UIColor.black : UIColor.white
            
            return filterCell
        case eventsCollectionView :   let eventsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellID", for: indexPath) as! EventsCell
            
            eventsCell.eventsLabel.text = testData[indexPath.section][indexPath.row] + "  \(indexPath.row)"
            
            eventsCell.backgroundColor = UIColor(red: 0.161, green: 0.165, blue: 0.18, alpha: 0.6)
            
            if indexPath.row == testData[indexPath.section].count - 1 {
                
                print("There is that index")
                eventsCell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                eventsCell.layer.cornerRadius = 10.0
            }
            return eventsCell
        default:
            return UICollectionViewCell()
        }
        
        
      
          
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerViewID", for: indexPath) as! CustomHeaderView
        
        headerView.headerTitleLabel.text = testData[indexPath.section][0]
        
        headerView.backgroundColor = UIColor(red: 0.161, green: 0.165, blue: 0.18, alpha: 0.6)
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerView.layer.cornerRadius = 10.0
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == eventsCollectionView { return CGSize(width: collectionView.frame.width, height: 35)} else { return CGSize(width: self.view.frame.width, height: 36)}
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == eventsCollectionView { return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 15, right: 0.0) } else { return UIEdgeInsets() }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == eventsCollectionView { return 0.0} else{ return CGFloat() }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}




class EventsCell: UICollectionViewCell {
    @IBOutlet var eventsLabel: UILabel!
    override func awakeFromNib() {
        eventsLabel.textColor = .white
    }
}


class CustomHeaderView: UICollectionReusableView {
    @IBOutlet var headerTitleLabel: UILabel!
    override func awakeFromNib() {
        headerTitleLabel.textColor = .white
    }
}
