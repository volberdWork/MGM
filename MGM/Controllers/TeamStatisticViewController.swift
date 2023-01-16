import UIKit

class TeamStatisticViewController: UIViewController {
    let filterData = ["Home", "Live", "Team", "Player", "Premier League", "Some aanother", "Test League", "TET", "TRW", "WFD"]
    
    @IBOutlet var awayName: UILabel!
    @IBOutlet var homeName: UILabel!
   
    @IBOutlet var awayLogo: UIImageView!
    @IBOutlet var homeLogo: UIImageView!
    @IBOutlet var label: UILabel!
    var data: [Scores] = []
    var teamData:[Teams] = []

    @IBOutlet var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

       
    }
    
    func configureView(){
        self.collectionView.backgroundColor = view.backgroundColor
        self.label.text = data[0].home?.total ?? "No data"
        self.awayLogo?.kf.setImage(with: URL(string: teamData[0].away?.logo ?? "noData"))
        self.homeLogo?.kf.setImage(with: URL(string: teamData[0].home?.logo ?? "noData"))
        self.homeName?.text = teamData[0].home?.name
        self.awayName?.text = teamData[0].away?.name

    }
    
}



extension TeamStatisticViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return filterData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCellTeam
            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
          
        
    }
    
    
    
    
}


class FilterCellTeam: UICollectionViewCell {
    
    
    @IBOutlet var viewForLabel: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        
        configure()
        
        
    }
    
    private func configure(){
        filterLabel.textColor = .black
        viewForLabel.layer.cornerRadius = viewForLabel.frame.height / 2
        
    }
    
}
