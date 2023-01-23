import UIKit

class DetailViewController: UIViewController {
    let filterData = ["Game", "Events", "Team Statistics", "Players Statistics"]
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
   
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
//    @IBOutlet var label: UILabel!
    var data: [Scores] = []
    var teamData:[Teams] = []
    var gameData:[Game] = []
     

    @IBOutlet var firstCollectionView: UICollectionView!
  
    @IBOutlet var secondCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

       
    }
    
    func configureView(){
//        self.collectionView.backgroundColor = view.backgroundColor
//        self.label.text = "\(data[0].home?.total ?? 0)"
        self.awayLogo?.kf.setImage(with: URL(string: teamData[0].away?.logo ?? ""))
        self.homeLogo?.kf.setImage(with: URL(string: teamData[0].home?.logo ?? ""))
        self.homeName?.text = teamData[0].home?.name ?? ""
        self.awayName?.text = teamData[0].away?.name ?? ""
        self.dateLabel.text = "\(self.gameData[0].date?.date ?? "") \(self.gameData[0].date?.time ?? "")"
        self.statusLabel.text = self.gameData[0].status?.short ?? ""
        
    }
    
}



extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == firstCollectionView  {
            return filterData.count
        } else {
            return data.count
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView{
            return filterData.count
        } else {
            return data.count
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView{
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterEventsCellID", for: indexPath) as! FilterCellTeam
            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
        } else {
            let eventsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellID", for: indexPath) as! EventsCell
            
            eventsCell.eventsLabel.text = data[indexPath.section][indexPath.row] + "  \(5)"
            
            eventsCell.backgroundColor = UIColor(red: 0.161, green: 0.165, blue: 0.18, alpha: 1)
            
            if indexPath.row == data[indexPath.section].count - 1 {
            
                print("There is that index")
                eventsCell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                eventsCell.layer.cornerRadius = 10.0
                
            }
            
            return eventsCell
            

            
        }
        
    }
    
    
    
    
}


class FilterCellTeam: UICollectionViewCell {
    
    
    @IBOutlet var viewForLabel: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        
        configure()
        
        
    }
    
    private func configure(){
        filterLabel.textColor = .white
        viewForLabel.layer.cornerRadius = viewForLabel.frame.height / 2
        self.viewForLabel.backgroundColor =  .black
    
        self.viewForLabel.layer.borderWidth = 1
        self.viewForLabel.layer.borderColor = CGColor(red: 0.867, green: 0.875, blue: 0.894, alpha: 1)
        
    }
    
}



class EventsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var eventsLabel: UILabel!
    
    override func awakeFromNib() {
        eventsLabel.textColor = .white
        
        
    }
}


class CustomHeaderView: UICollectionReusableView {
    
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        headerTitleLabel.textColor = .white
    }
    
    
}
