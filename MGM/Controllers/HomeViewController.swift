import UIKit
import Alamofire
import Kingfisher

class HomeViewController: UIViewController {
    
    
    var lastIndexActive: IndexPath = [1,0]
    
    @IBOutlet var firstCollectionView: UICollectionView!
    @IBOutlet var secondCollectionView: UICollectionView!
    
    private var leages: [String] = []
    private var leagesIcon: [UIImage] = []
    private var isFirstTimeCell = true
    private var leageData: [All] = []
    private var all: [All] = []
    private var leagesId: [Int] = []
    private var leageId = 0
    private var toggleColorCell = false
    private var colorHeaderView: [UIColor] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        //додаємо на перше місце загальний масив (де будуть усі дані)
        leages.insert("All", at: 0)
        
    }
    
    
    
    
    
    
    private func configureView(){
        self.view.backgroundColor = Constants.Colors.black
        firstCollectionView.backgroundColor = Constants.Colors.black
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        
        let logo = UIImage(named: "MGMLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        secondCollectionView.backgroundColor = self.view.backgroundColor
        
        fetchData()
        fetchImage()
       
    }
    
    // заванатення івентів
    private var allData: [Response] = []
    func fetchData() {
        guard let data = LiveDataBuffer.upcomingData else { return }
        leages = data.response.compactMap{ $0.league?.name }
        leagesId = data.response.compactMap{$0.league?.id}
        let group = DispatchGroup()
        leagesId.forEach { id in
            group.enter()
            NetworkManager.shared.fetchData(endpoint: .getFixturesByLeague(id: String(id), from: Date.getToday, to: Date.getNextWeek)) { isLoaded in
                if isLoaded {
                    guard let data = LiveDataBuffer.upcomingData else { return group.leave() }
                    self.allData.append(contentsOf: data.response)
                    group.leave()
                }
            }
        }
        group.notify(queue: .main) {
            self.allData.sort(by: {$0.fixture?.date ?? "" < $1.fixture?.date ?? "Date()"})
            let dates = self.allData.compactMap({$0.fixture?.date})
            let _dates = dates.unique
            _dates.forEach { date in
                var _response: [Response] = []
                self.allData.forEach { response in
                    if response.fixture?.date == date {
                        _response.append(response)
                    }
                }
                self.all.append(All(date: date, responce: _response))
            }
            self.leageData = self.all
            self.secondCollectionView.reloadData()
        }
    }
    
    
    
    // завантаження зображень
    func fetchImage() {
        guard let data = LiveDataBuffer.upcomingData else { return }
        let group = DispatchGroup()
        data.response.forEach ({ response in
            group.enter()
            guard (response.league != nil) else { return }
            NetworkManager.shared.getImage(urlString: response.league!.logo!) { result in
                switch result {
                case .success(let image):
                    self.leagesIcon.append(image)
                    group.leave()
                case .failure(let failure):
                    self.leagesIcon.append(UIImage(named: "camera.fill")!)
                    group.leave()
                }
            }
        })
        group.notify(queue: .main) {
            self.firstCollectionView.reloadData()
        }
    }
    
    private func setupCollectionView(indexPath: IndexPath) {
        leageData.removeAll()
        
        
        if indexPath.row == 0 {
            leageData = all
            leageId = 0
            secondCollectionView.reloadData()
        } else {
            leageId = leagesId[indexPath.row - 1]
            all.forEach({ all in
                let _all = all.responce.filter({$0.league?.id == leageId})
                if !_all.isEmpty {
                    leageData.append(All(date: all.date, responce: _all ))
                }
            })
            
            print("Data:", all)
            secondCollectionView.reloadData()
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
            let dataCell = leageData[indexPath.section].responce[indexPath.row]
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                navigationController?.pushViewController(vc, animated: true)
                vc.data.append(dataCell)
                
                UIDevice.onOffVibration()
            }
            
        case firstCollectionView :
            //завантаження нових данних
           
            
            setupCollectionView(indexPath: indexPath)
           

            
            UIDevice.onOffVibration()
            
        default:
            return
        }
    }
}

func changeDateFormat(dateString: String, fromFormat: String, toFormat: String) ->String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = fromFormat
    
    let date = inputDateFormatter.date(from: dateString)
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = toFormat
    outputDateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return outputDateFormatter.string(from: date!)
}

extension HomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            
        case firstCollectionView : return leages.count
        case secondCollectionView : return leageData[section].responce.count
            
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == secondCollectionView {
            return leageData.count
        } else {
            return 1
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case secondCollectionView :
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! InfoEventsCell
            
            
            if leageId == 0 {
                leageData = all
            }
            let dataCell = leageData[indexPath.section].responce[indexPath.row]
            infoCell.timeLabel.text = changeDateFormat(dateString: (dataCell.fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
            infoCell.homeName.text = dataCell.teams?.home?.name
            infoCell.awayName.text = dataCell.teams?.away?.name
            let urlIconTeamFirst = URL(string: (dataCell.teams?.home?.logo ?? ""))
            let urlIconTeamSecond = URL(string: (dataCell.teams?.away?.logo ?? ""))
            infoCell.homeLogo.kf.setImage(with: urlIconTeamFirst)
            infoCell.awayLogo.kf.setImage(with: urlIconTeamSecond)
            infoCell.statusLabel.text = String.getStatus(response: dataCell)
            
            infoCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
            return infoCell
            
            
        case firstCollectionView :
            
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = leages[indexPath.row]
            
           
            
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


//MARK: All Struct
struct All {
    let date: String
    let responce: [Response]
}

