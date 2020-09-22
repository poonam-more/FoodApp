//
//  StarchVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class StarchVC: UIViewController {

    @IBOutlet weak var sweetStarchIcon: UIImageView!
    @IBOutlet weak var sweetStarchLabel: UILabel!
    @IBOutlet weak var potatoStarchIcon: UIImageView!
    @IBOutlet weak var potatoStarchLabel: UILabel!
    @IBOutlet weak var wheatStarchIcon: UIImageView!
    @IBOutlet weak var wheatStarchLabel: UILabel!
    @IBOutlet weak var whiteStarchIcon: UIImageView!
    @IBOutlet weak var whiteStarchLabel: UILabel!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    
    @IBOutlet weak var circleView: RoundingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sweetStarchIcon.isUserInteractionEnabled = true
        sweetStarchLabel.isUserInteractionEnabled = true
        potatoStarchIcon.isUserInteractionEnabled = true
        potatoStarchLabel.isUserInteractionEnabled = true
        wheatStarchIcon.isUserInteractionEnabled = true
        wheatStarchLabel.isUserInteractionEnabled = true
        whiteStarchIcon.isUserInteractionEnabled = true
        whiteStarchLabel.isUserInteractionEnabled = true
       
        sweetStarchIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        sweetStarchLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        potatoStarchIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        potatoStarchLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        //
        wheatStarchIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        wheatStarchLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        whiteStarchIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        whiteStarchLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
    }
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.sweetStarchIcon.isHidden = true
        self.sweetStarchLabel.isHidden = true
        self.potatoStarchIcon.isHidden = true
        self.potatoStarchLabel.isHidden = true
        self.wheatStarchIcon.isHidden = true
        self.wheatStarchLabel.isHidden = true
        self.whiteStarchIcon.isHidden = true
        self.whiteStarchLabel.isHidden = true
       
        messageLabel2.setTextWithTypeAnimation(typedText: "What type are you thinking?", characterDelay: 15)
        
        
        showStarchView()
    }
    func showStarchView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.sweetStarchIcon.isHidden = false
            self.sweetStarchLabel.isHidden = false
            self.potatoStarchIcon.isHidden = false
            self.potatoStarchLabel.isHidden = false
            self.wheatStarchIcon.isHidden = false
            self.wheatStarchLabel.isHidden = false
            self.whiteStarchIcon.isHidden = false
            self.whiteStarchLabel.isHidden = false
        }
    }
    
    @objc func prepareViewSelected(_ sender:UITapGestureRecognizer){
        
        let giftBodyVC = PrepareVC(nibName: "PrepareVC", bundle: nil)
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
