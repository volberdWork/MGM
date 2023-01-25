import UIKit
import RealmSwift

class RemindersViewController: UIViewController{ @IBOutlet var collectionView: UICollectionView!
    let realm = try? Realm()
    var realmArray: [InfoBaseRealm] = []
    var awaylogoLink = ""
    var homeLogoLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        self.collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
}


extension RemindersViewController:UICollectionViewDelegate{
    
    
}

extension RemindersViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
