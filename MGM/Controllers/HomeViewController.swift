import UIKit
import Alamofire
import Kingfisher

class HomeViewController: UIViewController {
    
    let filterData = ["Home", "Live", "Team", "Player", "Premier League", "Some aanother", "Test League", "TET", "TRW", "WFD"]
    var eventsData: [Response] = []
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    var date = "2023-01-16"
    
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var firstCollectionView: UICollectionView!
    @IBOutlet var secondCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
        getGameBase()
        
    }
    
   
    private func configureView(){
        self.view.backgroundColor = UIColor(red: 10/255, green: 5/255, blue: 5/255, alpha: 1)
        firstCollectionView.backgroundColor = self.view.backgroundColor
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        settingButton.imageView?.contentMode = .scaleAspectFill
        getGameBase()
        
    }
    
    
    
    
    func getGameBase(){
        let urlFixtures = "https://v1.american-football.api-sports.io/games?date=\(date)&timezone=America/New_York"
        
        AF.request(urlFixtures, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            
            do {
                let data = try decoder.decode(GameBase.self, from: respponseData)
                print(data.response ?? 0)
                print(data)
                self.eventsData = data.response!
                self.secondCollectionView.reloadData()
                
            } catch {
                print("Щось пішло не так")
            }
        }
    }
    
}



extension HomeViewController:  UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
            
        case secondCollectionView:
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "TeamStatisticViewController") as? TeamStatisticViewController {
                navigationController?.pushViewController(vc, animated: true)
                vc.data.append(eventsData[indexPath.row].scores!)
                vc.teamData.append(eventsData[indexPath.row].teams!)

            }
            
        case firstCollectionView : print("Selected")
            
            
            
        default:
            return
        }
    }
}



extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case secondCollectionView : return eventsData.count
        case firstCollectionView : return filterData.count
        
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            
        case secondCollectionView :
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! InfoEventsCell
            infoCell.setupView(model: eventsData[indexPath.row])
            infoCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
           
            return infoCell
            
        case firstCollectionView :
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}






extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == secondCollectionView{
            return  CGSize(width: self.view.frame.width, height: self.view.frame.height / 6.5)
        }
        return CGSize()
    }

}
