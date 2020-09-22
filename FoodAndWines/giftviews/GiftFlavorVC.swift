//
//  GiftFlavorVC.swift
//  cambridgewines
//
//  Created by Poonam on 03/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class GiftFlavorVC: Baseviewcontroller {

    @IBOutlet weak var earthyRadioButton: RadioButton!
    @IBOutlet weak var fruityRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    
    @IBOutlet weak var lbl2: DesignableLabelView!
    @IBOutlet weak var stacktext: UIStackView!
    @IBOutlet weak var viewitems: UIView!
    @IBOutlet weak var lblfalvour: UILabel!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []

    var giftStyleString:String?
    var giftBodyString:String?
    
    @IBOutlet weak var selectionView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.selectionViewSelected (_:)))
        self.selectionView.addGestureRecognizer(tapGesture)
        arrButtons.append(fruityRadioButton)
        arrButtons.append(earthyRadioButton)
       
       
        // Do any additional setup after loading the view.
    
    arrayScrrenButtons.append(screen1Button)
    arrayScrrenButtons.append(screen2Button)
    arrayScrrenButtons.append(screen3Button)
    arrayScrrenButtons.append(screen4Button)
    
}
    override func viewWillAppear(_ animated: Bool) {
        self.lblfalvour.isHidden = true
        self.selectionView.isHidden = true
        self.viewitems.isHidden = true
        self.stacktext.isHidden = true
        
        lbl2.setTextWithTypeAnimation(typedText: "Which flavor do you think they like?", characterDelay: 15)
        self.showgiftingview()
        if giftFlavorString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if giftFlavorString == "Fruity"{
                fruityRadioButton.isOn = true
                
            }else if giftFlavorString == "Earthy"{
                earthyRadioButton.isOn = true
                
            }
        }
    }
    func showgiftingview()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.lblfalvour.isHidden = false
            self.selectionView.isHidden = false
            self.viewitems.isHidden = false
            self.stacktext.isHidden = false
        }
    }
@IBAction func scrrenBtnAction(_ sender: UIButton) {
    if let index = arrayScrrenButtons.index(where: { $0 == sender }) {
        if index == 0{
            let giftBodyVC = GiftVC(nibName: "GiftVC", bundle: nil)
            self.push(viewController: giftBodyVC)
            
        } else if index == 1{
            let giftBodyVC = GiftBodyVC(nibName: "GiftBodyVC", bundle: nil)
            self.push(viewController: giftBodyVC)
            //  dismissViewController(animated: true)
        }
    }
}
    @objc func selectionViewSelected(_ sender:UITapGestureRecognizer){
        // do other task
//        let giftPriceVC = GiftPriceVC(nibName: "GiftPriceVC", bundle: nil)
//        self.push(viewController: giftPriceVC)
    }

    @IBAction func radioButtonAction(_ sender: RadioButton) {
        for btn in arrButtons {
            // btn.isSelected = false
            btn.isOn = false
            print("init")
        }
        if let index = arrButtons.index(where: { $0 == sender }) {
            //arrButtons[index].isSelected = true
            //let button =  arrButtons[index]
            //button.isOn = true
            //arrButtons[index].gap = 4
            
            print("selected")
            print("index=\(arrButtons[index])")
            var selectedFlavor = ""
            switch index {
            case 0: selectedFlavor = "Fruity"
                break
            // executable code
            case 1: selectedFlavor = "Earthy"
                break
            // executable code
            
            default:
                break
                // executable code
            }
            
            let giftBodyVC = GiftPriceVC(nibName: "GiftPriceVC", bundle: nil)
         
            giftFlavorString = selectedFlavor
            self.push(viewController: giftBodyVC)
            
    }
    

}
    @IBAction func homeViewButtonClicked(_ sender: Any) {
        let giftBodyVC = OnlineVC(nibName: "OnlineVC", bundle: nil)
        self.push(viewController: giftBodyVC)
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        let giftBodyVC = HomeView(nibName: "HomeView", bundle: nil)
        self.push(viewController: giftBodyVC)
       
    }
    @IBAction func bckButtonClicked(_ sender: Any) {
        self.dismissViewController(animated: true)
    }
    
}
