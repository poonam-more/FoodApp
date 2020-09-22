//
//  MeatVC.swift
//  cambridgewines
//
//  Created by Poonam on 16/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class MeatVC: UIViewController {

    @IBOutlet weak var shellFishLabel: UILabel!
    @IBOutlet weak var shellFishIcon: UIImageView!
    @IBOutlet weak var fishIcon: UIImageView!
    @IBOutlet weak var checkenIcon: UIImageView!
    @IBOutlet weak var beefIcon: UIImageView!
    @IBOutlet weak var hamIcon: UIImageView!
    @IBOutlet weak var porkIcon: UIImageView!
    @IBOutlet weak var checkenLabel: UILabel!
    @IBOutlet weak var beefLabel: UILabel!
    @IBOutlet weak var hamLabel: UILabel!
    @IBOutlet weak var porkLabel: UILabel!
    
    @IBOutlet weak var fishLabel: UILabel!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    @IBOutlet weak var circleView: RoundingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shellFishIcon.isUserInteractionEnabled = true
        fishIcon.isUserInteractionEnabled = true
        checkenIcon.isUserInteractionEnabled = true
        beefIcon.isUserInteractionEnabled = true
        hamIcon.isUserInteractionEnabled = true
        porkIcon.isUserInteractionEnabled = true
        shellFishLabel.isUserInteractionEnabled = true
        fishLabel.isUserInteractionEnabled = true
        checkenLabel.isUserInteractionEnabled = true
        beefLabel.isUserInteractionEnabled = true
        hamLabel.isUserInteractionEnabled = true
        porkLabel.isUserInteractionEnabled = true
        
        
        shellFishIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        shellFishLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        fishIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        fishLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        //
        checkenIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        checkenLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        beefIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        beefLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        hamIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        hamLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        porkIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        porkLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.shellFishIcon.isHidden = true
        self.shellFishLabel.isHidden = true
        self.fishIcon.isHidden = true
        self.fishLabel.isHidden = true
        self.checkenIcon.isHidden = true
        self.beefIcon.isHidden = true
        self.checkenLabel.isHidden = true
        self.beefLabel.isHidden = true
        self.hamIcon.isHidden = true
        self.hamLabel.isHidden = true
        self.porkIcon.isHidden = true
        self.porkLabel.isHidden = true
        messageLabel2.setTextWithTypeAnimation(typedText: "What type are you thinking?", characterDelay: 15)
      
        
        showMeatView()
    }
    func showMeatView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.shellFishIcon.isHidden = false
            self.shellFishLabel.isHidden = false
            self.fishIcon.isHidden = false
            self.fishLabel.isHidden = false
            self.checkenIcon.isHidden = false
            self.beefIcon.isHidden = false
            self.checkenLabel.isHidden = false
            self.beefLabel.isHidden = false
            self.hamIcon.isHidden = false
            self.hamLabel.isHidden = false
            self.porkIcon.isHidden = false
            self.porkLabel.isHidden = false
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
