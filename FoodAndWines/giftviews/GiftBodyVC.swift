//
//  GiftBodyVC.swift
//  cambridgewines
//
//  Created by Poonam on 03/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class GiftBodyVC: Baseviewcontroller {

    @IBOutlet weak var mediumBodyRadioButton: RadioButton!
    @IBOutlet weak var fullBodyRadioButton: RadioButton!
    @IBOutlet weak var selectionView: UIView!
    
    var arrButtons:[RadioButton] = []
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    var arrayScrrenButtons:[UIButton] = []

    @IBOutlet weak var viewbodyitems: UIView!
    @IBOutlet weak var textstackview: UIStackView!
    @IBOutlet weak var lblbody: UILabel!
    @IBOutlet weak var message1Label: DesignableLabelView!
    @IBOutlet weak var message2Label: DesignableLabelView!
    
    var giftStyleString:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.selectionViewSelected (_:)))
        self.selectionView.addGestureRecognizer(tapGesture)
        
        arrButtons.append(fullBodyRadioButton)
        arrButtons.append(mediumBodyRadioButton)
    
    
    arrayScrrenButtons.append(screen1Button)
    arrayScrrenButtons.append(screen2Button)
    arrayScrrenButtons.append(screen3Button)
    arrayScrrenButtons.append(screen4Button)
    
}
    override func viewWillAppear(_ animated: Bool) {
        
        self.lblbody.isHidden = true
        self.selectionView.isHidden = true
        self.viewbodyitems.isHidden = true
        self.textstackview.isHidden = true
        
        message2Label.setTextWithTypeAnimation(typedText: "What body of red are you thinking?", characterDelay: 15)
        
        self.showgiftingview()
        if giftBodyString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if giftBodyString == "Full"{
                
                fullBodyRadioButton.isOn = true
                
            }else if giftBodyString == "Medium"{
                mediumBodyRadioButton.isOn = true
            }
        }
    }
    func showgiftingview()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.lblbody.isHidden = false
            self.selectionView.isHidden = false
            self.viewbodyitems.isHidden = false
            self.textstackview.isHidden = false
        }
    }
    

@IBAction func scrrenBtnAction(_ sender: UIButton) {
    if let index = arrayScrrenButtons.index(where: { $0 == sender }) {
        if index == 0{
            dismissViewController(animated: true)
        }
    }
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
            var selectedBody:String = ""
            print("selected")
            print("index=\(arrButtons[index])")
            switch index {
            case 0:selectedBody = "Full"
                break
            // executable code
            case 1: selectedBody = "Medium"
                break
            // executable code
                
            default:
                break
                // executable code
            }
            
            let giftBodyVC = GiftFlavorVC(nibName: "GiftFlavorVC", bundle: nil)
          //  giftStyleString = self.giftStyleString
            giftBodyString = selectedBody
            self.push(viewController: giftBodyVC)
        }
    }
    @objc func selectionViewSelected(_ sender:UITapGestureRecognizer){
        // do other task
//        let giftFlavorVC = GiftFlavorVC(nibName: "GiftFlavorVC", bundle: nil)
//        self.push(viewController: giftFlavorVC)
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        let giftBodyVC = HomeView(nibName: "HomeView", bundle: nil)
        self.push(viewController: giftBodyVC)
        
    }
    @IBAction func homeViewButtonClicked(_ sender: Any) {
        let giftBodyVC = OnlineVC(nibName: "OnlineVC", bundle: nil)
        self.push(viewController: giftBodyVC)
        
    }
    @IBAction func bckButtonClicked(_ sender: Any) {
        self.dismissViewController(animated: true)

    }
}
