import UIKit

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
