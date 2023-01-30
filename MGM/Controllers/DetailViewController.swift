import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let filterData = ["Game", "Events", "Team Statistics", "Players Statistics"]
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
    let realm = try? Realm()
    
    @IBOutlet var saveButton: UIButton!
//    var data: [Scores] = []
//    var teamData:[Teams] = []
    //    var gameData:[Game] = []
//    var eventsData: [Response] = []
    var lastIndexActive: IndexPath = [1,0]
    
    
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tappedMe))
        let ta2 = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tappedMe))
     homeLogo.addGestureRecognizer(tap)
        homeLogo.isUserInteractionEnabled = true
        awayLogo.addGestureRecognizer(ta2)
           awayLogo.isUserInteractionEnabled = true
     
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.backgroundColor = .clear
        
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.backgroundColor = .clear
        
        configureView()
        
    }
    
    @objc func tappedMe()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "PlayersViewController") as? PlayersViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func configureView(){
        //        self.awayLogo?.kf.setImage(with: URL(string: eventsData[0].teams?.home?.logo ?? ""))
        //        self.homeLogo?.kf.setImage(with: URL(string: teamData[0].home.logo))
        //        self.homeName?.text = teamData[0].home.name
        //        self.awayName?.text = teamData[0].away.name
        //        self.dateLabel.text = "\(self.gameData[0].date.date) \(self.gameData[0].date.time)"
        //        self.statusLabel.text = self.gameData[0].status.short
    }
    
    func loadAllert(){
        let alert = UIAlertController(title: "Save Event", message: "For save tap ok", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.saveButton.setImage(UIImage(named: "savedStar"), for: .normal)
            UIDevice.onOffVibration()
            self.saveToRealm()
            print("Save and updaterealm")
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
        let infoBaseRealm = InfoBaseRealm()
        //        infoBaseRealm.gameId = self.eventsData[0].id ?? 0
        //        infoBaseRealm.homeLogoLink = self.teamData[0].home.logo
        //        infoBaseRealm.awayLogoLink = self.teamData[0].away.logo
        //        infoBaseRealm.homaName = self.teamData[0].home.name
        //        infoBaseRealm.awayName = self.teamData[0].away.name
        ////        infoBaseRealm.date = self.gameData[0].date.time
        //        infoBaseRealm.yearText = self.eventsData[0]
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
        }
        
        
        
        //        saveToRealm()
        //        loadAllert()
        //        print("OKKK")
    }
    
    
    func saveToRealm(){
        let infoBaseRealm = InfoBaseRealm()
        //        infoBaseRealm.gameId = self.eventsData[0].id ?? 0
        //        infoBaseRealm.homeLogoLink = self.teamData[0].home.logo
        //        infoBaseRealm.awayLogoLink = self.teamData[0].away.logo
        //        infoBaseRealm.homaName = self.teamData[0].home.name
        //        infoBaseRealm.awayName = self.teamData[0].away.name
        //        infoBaseRealm.date = self.gameData[0].date.time
        //        infoBaseRealm.yearText = self.gameData[0].date.date
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
        }
        
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView{
        case filterCollectionView :
            if self.lastIndexActive != indexPath{
                let cell = filterCollectionView.cellForItem(at: indexPath) as! FilterCell
                cell.viewForLabel.backgroundColor = .white
                cell.filterLabel.textColor = .black
                cell.viewForLabel.layer.masksToBounds = true
                
                let cell2 = filterCollectionView.cellForItem(at: self.lastIndexActive) as? FilterCell
                cell2?.viewForLabel.backgroundColor = .black
                cell2?.filterLabel.textColor = .white
                cell2?.viewForLabel.layer.masksToBounds = true
                
                self.lastIndexActive = indexPath
            }
            
            UIDevice.onOffVibration()
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
        if collectionView == filterCollectionView {
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
        } else {
            let eventsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellID", for: indexPath) as! EventsCell
            
            eventsCell.eventsLabel.text = testData[indexPath.section][indexPath.row] + "  \(indexPath.row)"
            
            eventsCell.backgroundColor = UIColor(red: 0.161, green: 0.165, blue: 0.18, alpha: 0.6)
            
            if indexPath.row == testData[indexPath.section].count - 1 {
                
                print("There is that index")
                eventsCell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                eventsCell.layer.cornerRadius = 10.0
            }
            return eventsCell
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
