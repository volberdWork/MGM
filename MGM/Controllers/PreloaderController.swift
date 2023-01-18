import UIKit
import SnapKit

class PreloadreController: UIViewController {
    let logoImage = UIImage(named: "MGMLogo")
    private enum Layout {
        static let width = 145
        static let height = 45
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.loadVC()
        }
    }
    func loadVC(){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}

// MARK: Layout Method
extension PreloadreController {
    private func configureView() {
        view.backgroundColor = UIColor(displayP3Red: 41/255, green: 42/255, blue: 46/255, alpha: 1)
        let logo = UIImageView(image: logoImage)
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(Layout.width)
            make.height.equalTo(Layout.height)
        }
    }
}
