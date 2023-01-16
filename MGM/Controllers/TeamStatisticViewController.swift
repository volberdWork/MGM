import UIKit

class TeamStatisticViewController: UIViewController {
    let filterData = ["Home", "Live", "Team", "Player", "Premier League", "Some aanother", "Test League", "TET", "TRW", "WFD"]
    
    @IBOutlet var label: UILabel!
    var data: [Scores] = []

    @IBOutlet var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = view.backgroundColor
        label.text = data[0].home?.total ?? "No data"
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
