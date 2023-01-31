import UIKit

class DetailViewController: UIViewController {
    
    let filterData = ["Game", "Events", "Team Statistics", "Players Statistics"]
    
    var filetr: [String] = []
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
    
    
    
    @IBOutlet var saveButton: UIButton!
    
    var allData: [All] = []
    
    
        var teamData:[Teams] = []
       
  
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
        
     
        filetr.insert("Game", at: 0)
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.backgroundColor = .clear
        
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.backgroundColor = .clear
        
        configureView()
        
        
    }
    
    
    func configureView(){
      
                
    }
    
    func loadAllert(){
        let alert = UIAlertController(title: "Save Event", message: "For save tap ok", preferredStyle: .alert)

             let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
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
    
    
   
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        loadAllert()
        print("OKKK")
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView{
        case filterCollectionView : UIDevice.onOffVibration()
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
            return filetr.count
        } else {
            return testData[section].count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case eventsCollectionView :
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! InfoEventsCell
            
            
//            if leageId == 0 {
//                leageData = all
////            }
//            let dataCell = leageData[indexPath.section].responce[indexPath.row]
//            infoCell.homeName.text = dataCell.teams?.home?.name
//            infoCell.awayName.text = dataCell.teams?.away?.name
//            let urlIconTeamFirst = URL(string: (dataCell.teams?.home?.logo ?? ""))
//            let urlIconTeamSecond = URL(string: (dataCell.teams?.away?.logo ?? ""))
//            infoCell.homeLogo.kf.setImage(with: urlIconTeamFirst)
//            infoCell.awayLogo.kf.setImage(with: urlIconTeamSecond)
//            infoCell.dateLabel.text = String.getStatus(response: dataCell)
//
//            infoCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
            return infoCell
            
            
        case filterCollectionView :
            
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
//            filterCell.filterLabel.text = leages[indexPath.row]
            
            return filterCell
            
            
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
