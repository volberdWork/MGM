import UIKit
import SnapKit

class PreloadreController: UIViewController {
    
    let logoImage = UIImage(named: "MGMLogo")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadVC), userInfo: nil, repeats: false)
       configureView()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc
    func loadVC(){
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
            
        }
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
//        let button = UIButton()
//        view.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.height.equalTo(100)
//            make.width.equalTo(100)
//            make.center.equalToSuperview()
//        }
//        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(press), for: .touchUpInside)
//
        
       
    }
//    @objc func press(){
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = main.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController {
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
  
}

