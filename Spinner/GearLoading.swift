import Foundation
import UIKit

public class VMGearLoadingView:UIView {
    
    var removeFromSuperViewOnHide = false
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initItem()
    }
    
    convenience init(view:UIView){
        self.init(frame: view.bounds)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //set up gear items, loop through them and add to view
    func initItem(){
        
        let widthArray = [-60,-19,38,0]
        let heightArray = [20,-45,-20,0]
        let valueArray = [10,-18,15]
        let imageNameArray: [UIImage] = [UIImage(named: "gears 1")!,
            UIImage(named: "gears 2")!,
            UIImage(named: "gears 3")!,
            UIImage(named: "background")!]
        
        for (i, image) in imageNameArray.enumerate()
        {
            var img = UIImageView()
            img = UIImageView(image: image)
            img.contentMode = UIViewContentMode.Center
            img.center = CGPointMake(self.frame.width/2 + CGFloat(widthArray[i]), self.frame.height/2 + CGFloat(heightArray[i]))
            img.tag = i
            self.addSubview(img)
            
            if i < 3
            {
                runSpinAnimationWithDuration(30, withView: img, withValue: Float(valueArray[i]))
            }
        }
    }
    
    //animation for the gear rotation
    func runSpinAnimationWithDuration(duration:CGFloat, withView view:UIView, withValue value:Float){
        CATransaction.begin()
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.byValue = NSNumber(float: value)
        rotationAnimation.duration = CFTimeInterval(duration)
        
        if view.tag == 1
        {
            rotationAnimation.fromValue = NSNumber(float: Float(M_PI * 30))
            rotationAnimation.toValue = 0
            
        }
        else
        {
            rotationAnimation.fromValue = 0
            rotationAnimation.toValue = NSNumber(float: Float(M_PI * 30))
        }
        
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rotationAnimation.removedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        rotationAnimation.autoreverses = true
        rotationAnimation.repeatCount = 1000 // HUGE_VALF
        view.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        CATransaction.commit()
    }
    
    func stopSpinAnimation()
    {
        
    }
    
    //call for showGearLoadingForView
    convenience init?(showGearLoadingForView view:UIView){
        self.init(frame: view.bounds)
        self.alpha = 0
        view.addSubview(self)
        self.showViewWithAnimate(true)
        return nil
    }
    
    
    //call to hide loading
    func hideGearLoadingForView(view: UIView) -> Bool {
        self.hideViewWithAnimate(true)
        return true
    }
    
    func showViewWithAnimate(animate: Bool){
        print("mostro")
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1
            }, completion: { (finished: Bool) in
                
        })
    }
    
    func hideViewWithAnimate(animate: Bool){
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0
            }, completion: { (finished: Bool) in
                self.removeFromSuperview()
        })
    }
}


    //get view from main view
    func getGearLoadingForView(view:UIView) -> AnyObject {
        for member in view.subviews{
            if member.isKindOfClass(VMGearLoadingView){
                return member as! VMGearLoadingView
            }
        }
        return false
    }