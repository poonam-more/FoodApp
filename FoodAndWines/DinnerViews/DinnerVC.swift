//
//  DinnerVC.swift
//  cambridgewines
//
//  Created by Poonam on 14/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

var dinnerStyleString:String?
var dinnerBodyString:String?
var dinnerFlavorString:String?
var dinnerPrepareString:String?
var dinnerHerbsString:String?

var dinnerCheeseStyleString:String?
var dinnerCheeseBodyString:String?

class DinnerVC: UIViewController {

    @IBOutlet weak var roundingView: RoundingView!
    
    @IBOutlet weak var meatIcon: UIImageView!
    
    @IBOutlet weak var meatLabel: UILabel!
    @IBOutlet weak var vegIcon: UIImageView!
    
    @IBOutlet weak var vegLabel: UILabel!
    
    @IBOutlet weak var sweetLabel: UILabel!
    @IBOutlet weak var sweetIcon: UIImageView!
    
    @IBOutlet weak var cheeseIcon: UIImageView!
    @IBOutlet weak var cheeseLabel: UILabel!
    
    @IBOutlet weak var starchIcon: UIImageView!
    @IBOutlet weak var starchLabel: UILabel!
    
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    
    @IBOutlet weak var messageLabel3: DesignableLabelView!
    @IBOutlet weak var circleView: RoundingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        meatLabel.isUserInteractionEnabled = true
        meatIcon.isUserInteractionEnabled = true
        cheeseLabel.isUserInteractionEnabled = true
        cheeseIcon.isUserInteractionEnabled = true
        vegLabel.isUserInteractionEnabled = true
        vegIcon.isUserInteractionEnabled = true
        sweetLabel.isUserInteractionEnabled = true
        sweetIcon.isUserInteractionEnabled = true
        starchLabel.isUserInteractionEnabled = true
        starchIcon.isUserInteractionEnabled = true
        
        self.view.bringSubviewToFront(roundingView)
        
       
        meatIcon.addGestureRecognizer(setMeatGestureRecognizer())
        meatLabel.addGestureRecognizer(setMeatGestureRecognizer())
//
        vegIcon.addGestureRecognizer(setVegGestureRecognizer())
        vegLabel.addGestureRecognizer(setVegGestureRecognizer())
        
        cheeseIcon.addGestureRecognizer(setCheeseGestureRecognizer())
        cheeseLabel.addGestureRecognizer(setCheeseGestureRecognizer())
        
        sweetIcon.addGestureRecognizer(setDessertGestureRecognizer())
        sweetLabel.addGestureRecognizer(setDessertGestureRecognizer())
        
        starchIcon.addGestureRecognizer(setStarchGestureRecognizer())
        starchLabel.addGestureRecognizer(setStarchGestureRecognizer())
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.meatIcon.isHidden = true
        self.meatLabel.isHidden = true
        self.vegIcon.isHidden = true
        self.vegLabel.isHidden = true
        self.cheeseIcon.isHidden = true
        self.cheeseLabel.isHidden = true
        self.sweetIcon.isHidden = true
        self.sweetLabel.isHidden = true
        self.starchIcon.isHidden = true
        self.starchLabel.isHidden = true
        
        messageLabel2.setTextWithTypeAnimation(typedText: "We love to eat too!", characterDelay: 15)
        messageLabel3.setTextWithTypeAnimation(typedText: "What are you having?", characterDelay: 15)
        
        showDinnerView()
    }
    func showDinnerView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.meatIcon.isHidden = false
            self.meatLabel.isHidden = false
            self.vegIcon.isHidden = false
            self.vegLabel.isHidden = false
            self.cheeseIcon.isHidden = false
            self.cheeseLabel.isHidden = false
            self.sweetIcon.isHidden = false
            self.sweetLabel.isHidden = false
            self.starchIcon.isHidden = false
            self.starchLabel.isHidden = false
        }
    }
    
    @objc func meatViewSelected(_ sender:UITapGestureRecognizer){
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
         let giftBodyVC = MeatVC(nibName: "MeatVC", bundle: nil)
         self.push(viewController: giftBodyVC)
    }

    @objc func vegViewSelected(_ sender:UITapGestureRecognizer){
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        let giftBodyVC = VegVC(nibName: "VegVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }

    @objc func cheeseViewSelected(_ sender:UITapGestureRecognizer){
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        let giftBodyVC = CheeseVC(nibName: "CheeseVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }

    @objc func dessertViewSelected(_ sender:UITapGestureRecognizer){
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        let giftBodyVC = SweetVC(nibName: "SweetVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }

    @objc func starchViewSelected(_ sender:UITapGestureRecognizer){
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        let giftBodyVC = StarchVC(nibName: "StarchVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }

    func setMeatGestureRecognizer() -> UITapGestureRecognizer {
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.meatViewSelected(_:)))
        return meatTapGesture
    }
    func setVegGestureRecognizer() -> UITapGestureRecognizer {
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.vegViewSelected(_:)))
        return meatTapGesture
    }
    func setCheeseGestureRecognizer() -> UITapGestureRecognizer {
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.cheeseViewSelected(_:)))
        return meatTapGesture
    }
    func setDessertGestureRecognizer() -> UITapGestureRecognizer {
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.dessertViewSelected(_:)))
        return meatTapGesture
    }
    func setStarchGestureRecognizer() -> UITapGestureRecognizer {
        dinnerStyleString = nil
        dinnerBodyString = nil
        dinnerFlavorString = nil
        dinnerPrepareString = nil
        dinnerHerbsString = nil
        
        dinnerCheeseStyleString = nil
        dinnerCheeseBodyString = nil
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.starchViewSelected(_:)))
        return meatTapGesture
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
      
        let giftBodyVC = HomeView(nibName: "HomeView", bundle: nil)
        self.push(viewController: giftBodyVC)
    }
    
    @IBAction func homeButtonClicked(_ sender: Any) {
        let giftBodyVC = OnlineVC(nibName: "OnlineVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismissViewController(animated: true)

    }
}
extension UIView {
    
    fileprivate var bezierPathIdentifier:String { return "bezierPathBorderLayer" }
    
    fileprivate var bezierPathBorder:CAShapeLayer? {
        return (self.layer.sublayers?.filter({ (layer) -> Bool in
            return layer.name == self.bezierPathIdentifier && (layer as? CAShapeLayer) != nil
        }) as? [CAShapeLayer])?.first
    }
    
    func bezierPathBorder(_ color:UIColor = .white, width:CGFloat = 1) {
        
        var border = self.bezierPathBorder
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius:self.layer.cornerRadius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        if (border == nil) {
            border = CAShapeLayer()
            border!.name = self.bezierPathIdentifier
            self.layer.addSublayer(border!)
        }
        
        border!.frame = self.bounds
        let pathUsingCorrectInsetIfAny =
            UIBezierPath(roundedRect: border!.bounds, cornerRadius:self.layer.cornerRadius)
        
        border!.path = pathUsingCorrectInsetIfAny.cgPath
        border!.fillColor = UIColor.clear.cgColor
        border!.strokeColor = color.cgColor
        border!.lineWidth = width * 2
    }
    
    func removeBezierPathBorder() {
        self.layer.mask = nil
        self.bezierPathBorder?.removeFromSuperlayer()
    }
    
}

