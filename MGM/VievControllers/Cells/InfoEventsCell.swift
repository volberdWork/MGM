import UIKit

class InfoEventsCell: UICollectionViewCell{
    
    @IBOutlet var viewContent: UIView!
    
    @IBOutlet var dateLabel: UILabel!
   
    override func awakeFromNib() {
        
     
    }
    
    public func setupView(model: Configure){
        self.dateLabel.text = model.day
    }
    
}
