//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        // Create a rounded rectangle
        let roundedRect = UIView()
        roundedRect.frame = CGRect(x: 100, y: 200, width: 200, height: 150)
        roundedRect.backgroundColor = .lightGray
        roundedRect.layer.cornerRadius = 16
        
        // Create the inner shadow layer
        let innerShadowLayer = CALayer()
        // Make its frame the same size as this layer's bounds
        innerShadowLayer.frame = roundedRect.bounds
        // Create a path for the inner shadow layer that surrounds this layer's rounded bounds
        let path = UIBezierPath(roundedRect: innerShadowLayer.bounds.insetBy(dx: -20, dy: -20), cornerRadius: roundedRect.layer.cornerRadius)
        let innerPath = UIBezierPath(roundedRect: innerShadowLayer.bounds, cornerRadius: roundedRect.layer.cornerRadius).reversing()
        path.append(innerPath)
        innerShadowLayer.shadowPath = path.cgPath
        // Don't let the shadow go outside of this layer's rounded bounds
        innerShadowLayer.masksToBounds = true
        innerShadowLayer.cornerRadius = roundedRect.layer.cornerRadius
        // Set all of the shadow properties
        innerShadowLayer.shadowRadius = 4
        innerShadowLayer.shadowColor = UIColor.black.cgColor
        innerShadowLayer.shadowOffset = CGSize(width: 2, height: 2)
        innerShadowLayer.shadowOpacity = 0.5
        // Add the inner shadow layer
        roundedRect.layer.addSublayer(innerShadowLayer)
        
        view.addSubview(roundedRect)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
