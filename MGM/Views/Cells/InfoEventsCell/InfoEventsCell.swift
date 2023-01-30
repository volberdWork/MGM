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
    
    
    public func setupView(model: Response){
        self.homeLogo.kf.setImage(with: URL(string: model.teams?.home?.logo ?? ""))
        homeLogo.contentMode = .scaleAspectFill
        awayLogo.contentMode = .scaleAspectFill
        self.awayLogo.kf.setImage(with: URL(string: model.teams?.away?.logo ?? ""))
        self.homeName.text = model.teams?.home?.name ?? "No data"
        self.awayName.text = model.teams?.away?.name ?? "No data"
        self.viewContent.backgroundColor = UIColor(red: 0.867, green: 0.875, blue: 0.894, alpha: 1)
        
        //        self.timeLabel.text = "• Today • \(model.game?.date?.time ?? "") AM"
        //        self.dateLabel.text = model.game?.date?.date ?? ""
    }
    
}
