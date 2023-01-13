import UIKit

class HomeViewController: UIViewController {
    
    let filterData = ["Home", "Live", "Team", "Player", "Premier League", "Some aanother", "Test League", "TET", "TRW", "WFD"]
    var eventsData: [Configure] = []
    
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var firstCollectionView: UICollectionView!
    @IBOutlet var secondCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        eventsData.append(Configure(day: "Events"))
        
    }
    
    
    
    
    
    
    
    
    
    
    private func configureView(){
        self.view.backgroundColor = .black
        firstCollectionView.backgroundColor = self.view.backgroundColor
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        settingButton.imageView?.contentMode = .scaleAspectFill
        
    }
    
    
    
    
    
    
    
    
    
}



extension HomeViewController:  UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
            
        case secondCollectionView:
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "TeamStatisticViewController") as? TeamStatisticViewController {
                navigationController?.pushViewController(vc, animated: true)
               
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
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! InfoEventsCell
            filterCell.setupView(model: eventsData[indexPath.row])
            filterCell.backgroundColor = UIColor(red: 221/255, green: 223/255, blue: 228/255, alpha: 1)
           
            return filterCell
            
        case firstCollectionView :
            let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
            filterCell.filterLabel.text = filterData[indexPath.row]
            
            return filterCell
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
    
    
    
    
    
}


class FilterCell: UICollectionViewCell {
    
    
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


class InfoEventsCell: UICollectionViewCell{
    
    @IBOutlet var viewContent: UIView!
    
    @IBOutlet var dateLabel: UILabel!
   
    override func awakeFromNib() {
        
     
    }
    
    public func setupView(model: Configure){
        self.dateLabel.text = model.day
    }
    
}
