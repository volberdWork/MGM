import UIKit
import Kingfisher

class InfoEventsCell: UICollectionViewCell{
    
    @IBOutlet var viewContent: UIView!
    
    @IBOutlet var homeName: UILabel!
    @IBOutlet var homeLogo: UIImageView!
   
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var awayName: UILabel!
    @IBOutlet var awayLogo: UIImageView!
    override func awakeFromNib() {
        
     
    }
    
    public func setupView(model: Response){
        self.homeLogo.kf.setImage(with: URL(string: model.teams?.home?.logo ?? "noData"))
        homeLogo.contentMode = .scaleAspectFill
        awayLogo.contentMode = .scaleAspectFill
        self.awayLogo.kf.setImage(with: URL(string: model.teams?.away?.logo ?? "noData"))
        self.homeName.text = model.teams?.home?.name ?? "No data"
        self.awayName.text = model.teams?.away?.name ?? "No data"
        
    }
    
}