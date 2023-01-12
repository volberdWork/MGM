import UIKit
import SnapKit
class PresentViewController: UIViewController{
    
    lazy var firstView: UIView = {
        let view = UIView()
        self.view.backgroundColor = .black
        
        let image = UIImage(named: "presentFirstImage")
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        let textLabel = UILabel()
        textLabel.text = "Do you want to be at the epicenter of American football events?"
        textLabel.font = UIFont(name:"Roboto", size: 24.0)
        textLabel.numberOfLines = 4
        textLabel.textColor = .white
        imageView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(27)
            make.bottom.equalToSuperview().inset(imageView.frame.height/5)
            make.width.equalTo(300)
            make.height.equalTo(120)
            
        }
        
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView()
        let image = UIImage(named: "presentSecondImage")
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        return view
    }()
    
    lazy var thirdView: UIView = {
        let view = UIView()
        let image = UIImage(named: "presentThirdImage")
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        return view
    }()
    
    lazy var views = [firstView, secondView, thirdView]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        
        view.addSubview(pageControl)
        pageControl.pinTo(view)
    }
    
    
}

extension PresentViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
