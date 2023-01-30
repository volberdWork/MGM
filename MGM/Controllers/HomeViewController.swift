import UIKit
import Alamofire
import Kingfisher

class HomeViewController: UIViewController {
    
    let filterData = ["Home", "Live", "Team", "Player", "Premier League", "Some aanother", "Test League", "TET", "TRW", "WFD"]
    var eventsData: [Response]? = []
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    var date = "2023-01-26"
    var lastIndexActive: IndexPath = [1,0]
    
    @IBOutlet var firstCollectionView: UICollectionView!
    @IBOutlet var secondCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        print(date)
        loadGameBase()
    }
    
    
    
    
    
    
    private func configureView(){
        //        secondCollectionView.register(UINib(nibName: "InfoEventsCell", bundle: .main), forCellWithReuseIdentifier: "CellId")
        self.view.backgroundColor = Constants.Colors.black
        firstCollectionView.backgroundColor = self.view.backgroundColor
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        
        //        loadFixtersBase()
        let logo = UIImage(named: "MGMLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        secondCollectionView.backgroundColor = self.view.backgroundColor
        
        
    }
    func loadGameBase(){
            let urlFixtures = "https://v1.basketball.api-sports.io/games?date=2023-07-30"
            AF.request(urlFixtures, headers: headers).responseJSON { responseJSON in
                let decoder = JSONDecoder()
                guard let respponseData = responseJSON.data else {return}
                do {
                    let data = try decoder.decode(GameBase.self, from: respponseData)
                } catch {
                    print("Щось пішло не так")
                }
            }
        }
    
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            UIDevice.onOffVibration()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func settingsButton(_ sender: UIBarButtonItem) {
        UIDevice.onOffVibration()
    }
}

extension HomeViewController:  UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case secondCollectionView:
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                navigationController?.pushViewController(vc, animated: true)
                //                vc.eventsData.append(eventsData?[indexPath.row] ?? <#default value#>)
                UIDevice.onOffVibration()
            }
            
        case firstCollectionView :
            if self.lastIndexActive != indexPath{
                let cell = firstCollectionView.cellForItem(at: indexPath) as! FilterCell
                cell.viewForLabel.backgroundColor = UIColor(red: 0.867, green: 0.875, blue: 0.894, alpha: 1)
                cell.filterLabel.textColor = .black
                cell.viewForLabel.layer.masksToBounds = true
                
                let cell2 = firstCollectionView.cellForItem(at: self.lastIndexActive) as? FilterCell
                cell2?.viewForLabel.backgroundColor = .black
                cell2?.filterLabel.textColor = UIColor(red: 0.867, green: 0.875, blue: 0.894, alpha: 1)
                cell2?.viewForLabel.layer.masksToBounds = true
                
                self.lastIndexActive = indexPath
            }
            print("Selected \(filterData[indexPath.row])")
            UIDevice.onOffVibration()
            
            
            
        default:
            return
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case secondCollectionView : return 23
        case firstCollectionView : return filterData.count
            
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case secondCollectionView :
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! InfoEventsCell
            //            infoCell.setupView(model: eventsData![indexPath.row])
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
        
        if collectionView == firstCollectionView{
            return CGSize(width: 30, height: 110)
        } else{
            return CGSize(width: self.view.frame.width, height: 110)
        }
        
    }
}
