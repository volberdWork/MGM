import UIKit
import SnapKit

class PreloadreController: UIViewController {
    
    let logoImage = UIImage(named: "MGMLogo")

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
 
        configureView()
        
    }
    
   private func configureView(){
        view.backgroundColor = UIColor(displayP3Red: 41/255, green: 42/255, blue: 46/255, alpha: 1)
        let logo = UIImageView(image: logoImage)
        view.addSubview(logo)
       logo.snp.makeConstraints { make in
           make.center.equalToSuperview()
           make.width.equalTo(145)
           make.height.equalTo(45)
       }
        
        
        
    }
    
    


}

