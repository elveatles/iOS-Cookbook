//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 200)
        label.numberOfLines = 5
        
        let attributedString = NSMutableAttributedString(string: "Hello World!\n")
        let line = NSMutableAttributedString(string: "Hello Universe!")
        line.addAttribute(.foregroundColor, value: UIColor.red, range: NSMakeRange(0, line.length))
        attributedString.append(line)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 15
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
