//
//  CheeseVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class CheeseVC: UIViewController {

    @IBOutlet weak var hardCheeseIcon: UIImageView!
    @IBOutlet weak var hardCheesLabel: UILabel!
    @IBOutlet weak var softCheeseIcon: UIImageView!
    @IBOutlet weak var softCheeseLabel: UILabel!
    @IBOutlet weak var pungentCheeseIcon: UIImageView!
    @IBOutlet weak var pungentCheeseLabel: UILabel!
    
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    
    @IBOutlet weak var circleView: RoundingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hardCheeseIcon.isUserInteractionEnabled = true
        hardCheesLabel.isUserInteractionEnabled = true
        softCheeseIcon.isUserInteractionEnabled = true
        softCheeseLabel.isUserInteractionEnabled = true
        pungentCheeseIcon.isUserInteractionEnabled = true
        pungentCheeseLabel.isUserInteractionEnabled = true
        
        hardCheeseIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        hardCheesLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        softCheeseIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        softCheeseLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        //
        pungentCheeseIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        pungentCheeseLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.hardCheeseIcon.isHidden = true
        self.hardCheesLabel.isHidden = true
        self.softCheeseIcon.isHidden = true
        self.softCheeseLabel.isHidden = true
        self.pungentCheeseIcon.isHidden = true
        self.pungentCheeseLabel.isHidden = true
       
        messageLabel2.setTextWithTypeAnimation(typedText: "What type are you thinking?", characterDelay: 15)
        
        
        showCheeseView()
    }
    func showCheeseView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.hardCheeseIcon.isHidden = false
            self.hardCheesLabel.isHidden = false
            self.softCheeseIcon.isHidden = false
            self.softCheeseLabel.isHidden = false
            self.pungentCheeseIcon.isHidden = false
            self.pungentCheeseLabel.isHidden = false
        }
    }
    
    @objc func prepareViewSelected(_ sender:UITapGestureRecognizer){
        print("cheese item")
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
