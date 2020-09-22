//
//  VegVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class VegVC: UIViewController {

    @IBOutlet weak var mushroomIcon: UIImageView!
    @IBOutlet weak var rootIcon: UIImageView!
    @IBOutlet weak var greenIcon: UIImageView!
    @IBOutlet weak var nightShadesIcon: UIImageView!
    @IBOutlet weak var nutsIcon: UIImageView!
    @IBOutlet weak var beansIcon: UIImageView!
    @IBOutlet weak var beansLabel: UILabel!
    @IBOutlet weak var nightShadesLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var rootLabel: UILabel!
    @IBOutlet weak var nutsLabel: UILabel!
    @IBOutlet weak var mushroomLabel: UILabel!
    
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    
    @IBOutlet weak var circleView: RoundingView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mushroomIcon.isUserInteractionEnabled = true
        rootIcon.isUserInteractionEnabled = true
        greenIcon.isUserInteractionEnabled = true
        nightShadesIcon.isUserInteractionEnabled = true
        nutsIcon.isUserInteractionEnabled = true
        beansIcon.isUserInteractionEnabled = true
        beansLabel.isUserInteractionEnabled = true
        nightShadesLabel.isUserInteractionEnabled = true
        greenLabel.isUserInteractionEnabled = true
        rootLabel.isUserInteractionEnabled = true
        nutsLabel.isUserInteractionEnabled = true
        mushroomLabel.isUserInteractionEnabled = true
        
        mushroomIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        mushroomLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        rootIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        rootLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        //
        greenIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        greenLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
       nightShadesIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        nightShadesLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        nutsIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        nutsLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        
        beansIcon.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
        beansLabel.addGestureRecognizer(prepareViewSelectedGestureRecognizer())
    }
    override func viewWillAppear(_ animated: Bool) {
        self.circleView.isHidden = true
        self.mushroomIcon.isHidden = true
        self.mushroomLabel.isHidden = true
        self.rootIcon.isHidden = true
        self.rootLabel.isHidden = true
        self.greenIcon.isHidden = true
        self.greenLabel.isHidden = true
        self.nightShadesIcon.isHidden = true
        self.nightShadesLabel.isHidden = true
        self.nutsIcon.isHidden = true
        self.nutsLabel.isHidden = true
        self.beansIcon.isHidden = true
        self.beansLabel.isHidden = true
        messageLabel2.setTextWithTypeAnimation(typedText: "What type are you thinking?", characterDelay: 15)
        
        
        showVegView()
    }
    func showVegView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.circleView.isHidden = false
            self.mushroomIcon.isHidden = false
            self.mushroomLabel.isHidden = true
            self.rootIcon.isHidden = false
            self.rootLabel.isHidden = false
            self.greenIcon.isHidden = false
            self.greenLabel.isHidden = false
            self.nightShadesIcon.isHidden = false
            self.nightShadesLabel.isHidden = false
            self.nutsIcon.isHidden = false
            self.nutsLabel.isHidden = false
            self.beansIcon.isHidden = false
            self.beansLabel.isHidden = false
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
