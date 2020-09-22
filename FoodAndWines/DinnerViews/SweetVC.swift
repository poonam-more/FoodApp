//
//  SweetVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class SweetVC: UIViewController {

    @IBOutlet weak var fruitBerryLabel: UILabel!
    @IBOutlet weak var fruitBerryIcon: UIImageView!
    @IBOutlet weak var chocolateIcon: UIImageView!
    @IBOutlet weak var chocolateLabel: UILabel!
    @IBOutlet weak var vanillaIcon: UIImageView!
    @IBOutlet weak var vanillaLabel: UILabel!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    
    @IBOutlet weak var circleView: RoundingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fruitBerryIcon.isUserInteractionEnabled = true
        fruitBerryLabel.isUserInteractionEnabled = true
        chocolateIcon.isUserInteractionEnabled = true
        chocolateLabel.isUserInteractionEnabled = true
        vanillaIcon.isUserInteractionEnabled = true
        vanillaLabel.isUserInteractionEnabled = true
        
        fruitBerryIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        fruitBerryLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        chocolateIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        chocolateLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        //
        vanillaIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        vanillaLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.fruitBerryIcon.isHidden = true
        self.fruitBerryLabel.isHidden = true
        self.chocolateIcon.isHidden = true
        self.chocolateLabel.isHidden = true
        self.vanillaIcon.isHidden = true
        self.vanillaLabel.isHidden = true
        
        messageLabel2.setTextWithTypeAnimation(typedText: "What type are you thinking?", characterDelay: 15)
        
        
        showSweetView()
    }
    func showSweetView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.fruitBerryIcon.isHidden = false
            self.fruitBerryLabel.isHidden = false
            self.chocolateIcon.isHidden = false
            self.chocolateLabel.isHidden = false
            self.vanillaIcon.isHidden = false
            self.vanillaLabel.isHidden = false
        }
    }
    @objc func prepareViewSelected(_ sender:UITapGestureRecognizer){
        print("sweet item")
         let giftBodyVC = DinnerCheeseStyleVC(nibName: "DinnerCheeseStyleVC", bundle: nil)
         self.push(viewController: giftBodyVC)
    }
    
    
    func prepareViewSelectedGestureRecognizer() -> UITapGestureRecognizer {
        var meatTapGesture = UITapGestureRecognizer()
        meatTapGesture = UITapGestureRecognizer (target: self, action: #selector(self.prepareViewSelected(_:)))
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
