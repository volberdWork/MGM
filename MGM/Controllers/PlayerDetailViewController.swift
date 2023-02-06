import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    let filterData = ["Details", "Passing", "Rushing"]
    var currentSelected:Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = self.view.backgroundColor
        
    }
    

}


extension PlayerDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCellID", for: indexPath) as! FilterCell
        filterCell.filterLabel.text = filterData[indexPath.row]
        filterCell.viewForLabel.backgroundColor = currentSelected == 0 ? UIColor.white : UIColor.clear
        filterCell.filterLabel.textColor = currentSelected == 0 ? UIColor.black : UIColor.white
        filterCell.viewForLabel.backgroundColor = currentSelected == indexPath.row ? UIColor.white : UIColor.clear
        filterCell.filterLabel.textColor = currentSelected == indexPath.row ? UIColor.black : UIColor.white
        
        
        return filterCell
    }
    
    
}


extension PlayerDetailViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIDevice.onOffVibration()
            currentSelected = indexPath.row
            collectionView.reloadData()
    }
}
