import UIKit

class FilterCell: UICollectionViewCell {

    @IBOutlet var viewForLabel: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    private func configure(){
        filterLabel.textColor = .white
        viewForLabel.layer.cornerRadius = viewForLabel.frame.height / 2
        
        self.viewForLabel.layer.borderWidth = 1
        self.viewForLabel.layer.borderColor = CGColor(red: 0.867, green: 0.875, blue: 0.894, alpha: 1)
    }
    
}
