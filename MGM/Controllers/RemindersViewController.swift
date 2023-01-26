import UIKit
import RealmSwift
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
        self.collectionView.reloadData()
        
    }
    
    func setupView(){
        self.collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
       
    }
}


extension RemindersViewController:UICollectionViewDelegate{
    
    
}

extension RemindersViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindersCollectionViewCell", for: indexPath) as! RemindersCollectionViewCell
        infoCell.layer.borderWidth = 0.4
        infoCell.layer.borderColor = CGColor(red: 243/255, green: 244/255, blue: 245/255, alpha: 0.5)
        return infoCell
        
       
    }
    
}


extension RemindersViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: 347, height: 122)
        
    }
}

