import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var view: UIView!
    
    @IBOutlet var imageStar: UIImageView!
    
    @IBOutlet var viewButton: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(media: ButtonSet){
        self.titleLabel.text = media.title
        self.imageStar.image = UIImage(named: media.imageName)
        viewButton.layer.borderWidth = 0.2
        viewButton.layer.borderColor = CGColor(red: 0.867, green: 0.857, blue: 0.894, alpha: 1)
    }
    
}


struct ButtonSet{
    var title:String
    var imageName: String
}
