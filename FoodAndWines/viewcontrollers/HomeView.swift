//
//  HomeView.swift
//  cambridgewines
//
//  Created by Abhishek Rathi on 28/09/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class HomeView: Baseviewcontroller {

    @IBOutlet weak var tutoriaview1: UIView!
    @IBOutlet weak var tutoriaview2: UIView!
    @IBOutlet weak var tutoriaview3: UIView!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var giftingimg: UIImageView!
    @IBOutlet weak var btngifting: UIButton!
    @IBOutlet weak var diningimg: UIImageView!
    @IBOutlet weak var btndining: UIButton!
    @IBOutlet weak var hostingimg: UIImageView!
    @IBOutlet weak var btnhosting: UIButton!
    
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tutorialview4: UIView!
    @IBOutlet weak var tutorialImageview3: RoundingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.isNavigationBarHidden = true
        self.diningimg.isHidden = true
        self.hostingimg.isHidden = true
        self.giftingimg.isHidden = true
        self.btndining.isHidden = true
        self.btngifting.isHidden = true
        self.btnhosting.isHidden = true
        
        lbl2.setTextWithTypeAnimation(typedText: "How can we we help you today?", characterDelay:  15)
        self.showimgview()
        self.tutoriaview1.isHidden = true
        self.tutoriaview2.isHidden = true
        self.tutoriaview3.isHidden = true
         self.tutorialview4.isHidden = true
        if UserDefaults.standard.object(forKey: "ShowTutorial") != nil
        {
            self.tutoriaview1.isHidden = true
            self.tutoriaview2.isHidden = true
            self.tutoriaview3.isHidden = true
            self.tutorialview4.isHidden = true

        }
        else
        {
            self.perform(#selector(self.showtutorialview1), with: self, afterDelay: 0.0)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.giftViewSelected (_:)))
        self.giftIcon.addGestureRecognizer(tapGesture)
        self.giftIcon.isUserInteractionEnabled = true
        
        let tapGestureHosting = UITapGestureRecognizer(target: self, action:  #selector (self.hostingViewSelected (_:)))
        self.hostIcon.addGestureRecognizer(tapGestureHosting)
        self.hostIcon.isUserInteractionEnabled = true
        
        let tapGestureDinner = UITapGestureRecognizer(target: self, action:  #selector (self.dinnerViewSelected (_:)))
        self.dinnerIcon.addGestureRecognizer(tapGestureDinner)
        self.dinnerIcon.isUserInteractionEnabled = true

        let menuButton1 = UIBarButtonItem(customView: menuButton)
        self.revealViewController().navigationItem.leftBarButtonItem = menuButton1
        
    }
    
    func showimgview()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.diningimg.isHidden = false
            self.hostingimg.isHidden = false
            self.giftingimg.isHidden = false
            self.btndining.isHidden = false
            self.btngifting.isHidden = false
            self.btnhosting.isHidden = false
        }
    }
    
    @objc func showtutorialview1() {
        UserDefaults.standard.set("Y", forKey: "ShowTutorial")
        self.tutoriaview1.isHidden = false
        self.perform(#selector(self.Hidetutorialview1), with: self, afterDelay: 3)
    }
    
    @objc func Hidetutorialview1() {
         self.tutoriaview1.isHidden = true
        self.perform(#selector(self.showtutorialview2), with: self, afterDelay: 0.0)
    }

    @objc func showtutorialview2() {
        self.tutoriaview2.isHidden = false
        self.perform(#selector(self.Hidetutorialview2), with: self, afterDelay: 3)
    }
    
    @objc func Hidetutorialview2() {
        self.tutoriaview2.isHidden = true
        self.perform(#selector(self.showtutorialview3), with: self, afterDelay: 0.0)
    }
    @objc func showtutorialview3() {
        self.tutoriaview3.isHidden = false
        self.perform(#selector(self.Hidetutorialview3), with: self, afterDelay: 3)
    }
    
    @objc func Hidetutorialview3() {
        self.tutoriaview3.isHidden = true
        self.perform(#selector(self.showtutorialview4), with: self, afterDelay: 0.0)

    }
    @objc func showtutorialview4() {
        self.tutorialview4.isHidden = false
        self.perform(#selector(self.Hidetutorialview4), with: self, afterDelay: 3)
    }
    
    @objc func Hidetutorialview4() {
        self.tutorialview4.isHidden = true
    }
    
    @IBOutlet weak var dinnerIcon: UIImageView!
    
    @IBOutlet weak var hostIcon: UIImageView!
    @IBOutlet weak var giftIcon: UIImageView!
    @IBAction func giftButtonClicked(_ sender: Any) {
        
        giftStyleString = ""
        giftBodyString = ""
        giftFlavorString = ""
        giftPriceRangeString = ""
        
        let giftVC = GiftVC(nibName: "GiftVC", bundle: nil)
        isGifting = true
        self.push(viewController: giftVC)
    }
    @IBAction func hostingButtonClicked(_ sender: Any) {
        giftStyleString = ""
        giftBodyString = ""
        giftFlavorString = ""
        giftPriceRangeString = ""
        
        let giftVC = GiftVC(nibName: "GiftVC", bundle: nil)
        isGifting = false
        self.push(viewController: giftVC)
    }
    @IBAction func dinnerButtonClicked(_ sender: Any) {
        let giftVC = DinnerVC(nibName: "DinnerVC", bundle: nil)
        revealViewController()?.push(viewController: giftVC)
        
    }
   
    
    @IBAction func searchButton_Clicked(_ sender: Any) {
//        let forgotpwd = TutorialVC(nibName: "TutorialVC", bundle: nil)
//        self.push(viewController: forgotpwd)
//
        
    }
   
    @objc func giftViewSelected(_ sender:UITapGestureRecognizer){
        
        giftStyleString = nil
        giftBodyString = nil
        giftFlavorString = nil
        giftPriceRangeString = nil
        
        let giftVC = GiftVC(nibName: "GiftVC", bundle: nil)
        isGifting = true
        self.push(viewController: giftVC)
    }
    
    @objc func hostingViewSelected(_ sender:UITapGestureRecognizer){
        giftStyleString = nil
        giftBodyString = nil
        giftFlavorString = nil
        giftPriceRangeString = nil
        
        let giftVC = GiftVC(nibName: "GiftVC", bundle: nil)
        isGifting = false
        self.push(viewController: giftVC)
    }
   
    @objc func dinnerViewSelected(_ sender:UITapGestureRecognizer){
        // do other task
         dinnerStyleString = nil
         dinnerBodyString = nil
         dinnerFlavorString = nil
         dinnerPrepareString = nil
         dinnerHerbsString = nil
        
         dinnerCheeseStyleString = nil
         dinnerCheeseBodyString = nil
        
        let giftVC = DinnerVC(nibName: "DinnerVC", bundle: nil)
        self.push(viewController: giftVC)
    }
    @IBAction func menuButtonClicked(_ sender: Any) {
        revealViewController().revealToggle(self)
    }
}
extension UIView {
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
}
extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
class RoundingView : UIView{
    
   /* @IBInspectable var isRoundedCorners: Bool = false {
        didSet { setNeedsLayout() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isRoundedCorners {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = UIBezierPath(ovalIn:
                CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height
            )).cgPath
            layer.mask = shapeLayer
        }
        else {
            layer.mask = nil
        }
        
    }*/
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}
extension UILabel {
    func setTextWithTypeAnimation(typedText: String, characterDelay: TimeInterval = 5.0) {
        text = ""
        var writingTask: DispatchWorkItem?
        writingTask = DispatchWorkItem { [weak weakSelf = self] in
            for character in typedText {
                DispatchQueue.main.async {
                    weakSelf?.text!.append(character)
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
        }
        
        if let task = writingTask {
            let queue = DispatchQueue(label: "typespeed", qos: DispatchQoS.userInteractive)
            queue.asyncAfter(deadline: .now() + 0.05, execute: task)
        }
    }
    
}
