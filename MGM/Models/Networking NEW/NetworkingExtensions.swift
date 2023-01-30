//
//  Extentions.swift
//  Estrela
//

import UIKit
import AVFoundation

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
      return UINib(
          nibName: nibNamed,
          bundle: bundle
      ).instantiate(withOwner: nil, options: nil)[0] as? UIView
  }
    
    func notAvailableDataLabel(parentView: UIView) -> UILabel {
        let label = UILabel()
        label.text = "There is no available data"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        parentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        ])
        return label
    }
}

extension UIColor {
   static let simiLarYellow = UIColor(red: 1, green: 0.8392, blue: 0.0392, alpha: 1.0)
   static let darkBlue = UIColor(red: 0.0314, green: 0.1098, blue: 0.2314, alpha: 1.0)
   static let oneMoreBlue = UIColor(red: 0, green: 0.1412, blue: 0.2863, alpha: 1.0)
    static let textColor = UIColor(red: 0.8863, green: 0.8941, blue: 0.902, alpha: 1.0)
    static let silver = UIColor(red: 0.8667, green: 0.8745, blue: 0.8941, alpha: 1.0)
}

extension UITableView {
    var disclosureView: UIImageView {
        let imageView = UIImageView(image: UIImage(named: "disclosureIcon"))
        imageView.frame = CGRect(x: 0, y: 0, width: 9, height: 17)
        return imageView
    }
}

extension Array where Element: Equatable {
   var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}

extension String {
    static func getStatus(response: Response) -> String {
         
        let status = response.fixture?.status?.short ?? ""
        if status == "NS" || status == "TBD"  {
            return "NS"
        } else if status == "CANC" {
            return "CANC"
        } else {
            let teamFirstScore = response.goals?.home
            let teamSecondScore = response.goals?.away
            if teamFirstScore == nil || teamSecondScore == nil {
                return "N/A"
            } else {
                return String(teamFirstScore!) + ":" + String(teamSecondScore!)
            }
        }
    }
}

