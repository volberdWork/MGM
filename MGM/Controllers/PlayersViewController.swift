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
//        loadFixtersBase(id: teamId)
    }
    
    func configure(){
        firstCollectionView.backgroundColor = self.view.backgroundColor
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
//    func loadFixtersBase(id: String){
//        let urlFixtures = "https://v1.american-football.api-sports.io/games/statistics/players?id=\(id)"
//
//        AF.request(urlFixtures, headers: headers).responseJSON { responseJSON in
//            let decoder = JSONDecoder()
//            guard let respponseData = responseJSON.data else {return}
//
//            do {
//                let data = try decoder.decode(PlayersStatisticBase.self, from: respponseData)
//
//                print(data)
//                self.playersdata = data.response ?? []
//
//                //                self.secondCollectionView.reloadData()
//                //                self.firstCollectionView.reloadData()
//
//            } catch {
//                print("Щось пішло не так")
//            }
//        }
//    }
    
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
            //            infoCell.setupView(model: eventsData[indexPath.row])
            infoCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
            
            
            return infoCell
            
        case firstCollectionView :
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            //            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}

