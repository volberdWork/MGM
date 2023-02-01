import UIKit
import RealmSwift
import Kingfisher
class RemindersViewController: UIViewController{
    
    @IBOutlet var collectionView: UICollectionView!
    let realm = try? Realm()
    var realmArray: [InfoBaseRealm] = []
    var awaylogoLink = ""
    var homeLogoLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.realmArray = []
        guard let infoMatchesResult = realm?.objects(InfoBaseRealm.self) else {return}
        for match in infoMatchesResult{
            self.realmArray.append(match)
        }
        if realmArray.count > 0{
            self.collectionView.reloadData()
        } else{
            showAlertAction(title: "Sorry", message: "No data")
        }
        
    }
    
    func setupView(){
        self.collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
    }
    
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


extension RemindersViewController:UICollectionViewDelegate{
    
    
}

extension RemindersViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = realmArray[indexPath.row]
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindersCollectionViewCell", for: indexPath) as! RemindersCollectionViewCell
        infoCell.layer.borderWidth = 1
        infoCell.layer.borderColor = CGColor(red: 243/255, green: 244/255, blue: 245/255, alpha: 0.5)
        
        infoCell.awayNameLabel.text = data.awayName
        infoCell.homeNameLabel.text = data.homaName
        infoCell.dateLabel.text = data.date
        
        let urlIconTeamFirst = URL(string: data.homeLogoLink)
        let urlIconTeamSecond = URL(string: data.awayLogoLink)
        infoCell.homeLogoImage.kf.setImage(with: urlIconTeamFirst)
        infoCell.awayLogoImage.kf.setImage(with: urlIconTeamSecond)
        
        return infoCell
        
        
    }
    
}


extension RemindersViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: 347, height: 122)
        
    }
}

