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
        var textForLabel = ""
        textLabel.text = """
        Do you want to be at
        the epicenter of
        American football
        events?
        """
        textLabel.font = UIFont(name:"Roboto", size: 24.0)
        textLabel.numberOfLines = 4
        textLabel.textColor = .white
        imageView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(27)
            make.bottom.equalToSuperview().inset(imageView.frame.height/4)
            make.width.equalTo(300)
            make.height.equalTo(130)
            
        }
        
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView()
        
        let image = UIImage(named: "presentSecondImage")
        
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
        textLabel.text = """
        Be aware of all the
        details and know
        the latest news
        with MGM team
        """
        
        textLabel.numberOfLines = 4
        textLabel.textColor = .white
        
        let strNumber: NSString = textLabel.text! as NSString
        var range = (strNumber).range(of: "MGM")
        
        var attributedString = NSMutableAttributedString(string: textLabel.text!, attributes: [NSAttributedString.Key.font:UIFont(name: "Roboto", size: 28.0)!])
        // here you change the character to red color
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value:  UIColor(red: 0.831, green: 0.725, blue: 0.384, alpha: 1), range: range)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Montserrat-ExtraBold", size: 30.0), range: range)
        
        textLabel.attributedText = attributedString
        
        imageView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(imageView.frame.height/5)
            make.left.equalTo(27)
            make.height.equalTo(190)
            
        }
        
        
        
        return view
    }()
    
    lazy var thirdView: UIView = {
        let view = UIView()
        let image = UIImage(named: "presentThirdImage")
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
        var textForLabel = ""
        textLabel.text = """
        The best sports
        book for true
        connoisseurs of
        brutal sports
        """
        textLabel.font = UIFont(name:"Roboto", size: 26.0)
        textLabel.numberOfLines = 4
        textLabel.textColor = .white
        imageView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(imageView.frame.height/5)
            make.width.equalTo(300)
            make.height.equalTo(160)
            
        }
        
        var buttonGetStarted = UIButton(type: .custom)
        buttonGetStarted.backgroundColor = .none
        let imageButton = UIImage(named: "startedButton")
       
       
        buttonGetStarted.setImage(imageButton, for: .normal)
        buttonGetStarted.clipsToBounds = true
        buttonGetStarted.imageView?.contentMode = .scaleToFill
//         buttonGetStarted.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        
        imageView.addSubview(buttonGetStarted)
        
        buttonGetStarted.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(42)
            make.centerX.equalTo(self.view.center.x)
            make.bottom.equalToSuperview().inset(100)
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
    
    @objc
    func loadVC(){
        
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






extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        var attributedString = NSAttributedString(string: fullText, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        self.attributedText = attributedString
    }
}
