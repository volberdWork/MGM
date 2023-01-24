import UIKit

class DetailViewController: UIViewController {
    let filterData = ["Game", "Events", "Team Statistics", "Players Statistics"]
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
    
    
    var data: [Scores] = []
    var teamData:[Teams] = []
    var gameData:[Game] = []
    
    
    let fisrtFilterData = ["All", "Q1", "Q2", "Q3", "Q4", "OT", "HT", "FT", "AOT", "CANC", "PST"]
    
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
        // Do any additional setup after loading the view.
        
        
        //
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.backgroundColor = .clear
        
        
        //
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.backgroundColor = .clear
        
        
    
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == filterCollectionView {
            return 1
        } else {
            return testData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == filterCollectionView {
            return fisrtFilterData.count
        } else {
            return testData[section].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == filterCollectionView {
           
            
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            
            filterCell.filterLabel.text = fisrtFilterData[indexPath.row]
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
