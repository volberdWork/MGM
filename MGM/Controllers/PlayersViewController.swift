import UIKit
import Alamofire

class PlayersViewController: UIViewController{
    
    
    
    @IBOutlet var firstCollectionView: UICollectionView!
    @IBOutlet var secondCollectionView: UICollectionView!
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    let filterData = ["Team", "Players"]
    var teamId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure(){
        firstCollectionView.backgroundColor = self.view.backgroundColor
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
    
    
}

extension PlayersViewController: UICollectionViewDelegate{
    
}

extension PlayersViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case secondCollectionView : return 20
        case firstCollectionView : return filterData.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            
        case secondCollectionView :
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCellId", for: indexPath) as! PlayerCollectionViewCell
            
            infoCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
            
            
            return infoCell
            
        case firstCollectionView :
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            
            return filterCell
        default:
            return UICollectionViewCell()
        }
    }
}

