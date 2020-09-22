//
//  GiftVC.swift
//  cambridgewines
//
//  Created by Poonam More on 03/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit


class GiftVC: Baseviewcontroller,AKSSegmentedSliderControlDelegate {
    @IBOutlet weak var redRadioButton: RadioButton!
    
    @IBOutlet weak var itemsview: UIView!
    @IBOutlet weak var stylestackview: UIStackView!
     @IBOutlet weak var stylestackview2: UIStackView!
    @IBOutlet weak var whiteRadioButton: RadioButton!
    
    @IBOutlet weak var roseRadionButton: RadioButton!
    
    @IBOutlet weak var sparklingRadioButton: RadioButton!
    
    @IBOutlet weak var desertRadioButton: RadioButton!
    @IBOutlet weak var viewsetps: UIView!
    @IBOutlet weak var lblstyle: UILabel!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    
    @IBOutlet weak var message1Label: DesignableLabelView!
    @IBOutlet weak var message2Label: DesignableLabelView!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // or for swift 2 +
        
       
     
        arrButtons.append(redRadioButton)
        arrButtons.append(whiteRadioButton)
        arrButtons.append(roseRadionButton)
        arrButtons.append(sparklingRadioButton)
        arrButtons.append(desertRadioButton)
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
      

    }
    
    
    func showgiftingview()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.stylestackview.isHidden = false
            self.viewsetps.isHidden = false
            self.itemsview.isHidden = false
            self.stylestackview.isHidden = false
            self.stylestackview2.isHidden = false
            self.lblstyle.isHidden = false
           
        }
    }
    @IBAction func scrrenBtnAction(_ sender: UIButton) {
        if let index = arrayScrrenButtons.index(where: { $0 == sender }) {
//            if index == 1{
//                let giftBodyVC = GiftBodyVC(nibName: "GiftBodyVC", bundle: nil)
//                giftBodyVC.giftStyleString = "RED"
//                self.push(viewController: giftBodyVC)
//
//            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.stylestackview.isHidden = true
        self.viewsetps.isHidden = true
        self.itemsview.isHidden = true
        self.lblstyle.isHidden = true
        self.stylestackview.isHidden = true
        self.stylestackview2.isHidden = true
        
        
        if isGifting!{
            message1Label.text = "Giving is important!"
            message2Label.setTextWithTypeAnimation(typedText: "What style are you thinking of giving?", characterDelay: 15)
            
        }else{
            message1Label.text = "Friends & Family!"
            message2Label.setTextWithTypeAnimation(typedText: "What style are you thinking of?", characterDelay: 15)
        }
        self.showgiftingview()
        
        if giftStyleString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if giftStyleString == "Red"{
                for btn in arrButtons {
                    // btn.isSelected = false
                    if btn.isOn == true{
                        btn.isOn = false
                    }
                    print("init")
                }
                redRadioButton.isOn = true
                
            }else if giftStyleString == "White"{
                whiteRadioButton.isOn = true
            }else if giftStyleString == "Rose"{
                roseRadionButton.isOn = true
            }else if giftStyleString == "Sparkling"{
                sparklingRadioButton.isOn = true
            }else if giftStyleString == "Dessert"{
                desertRadioButton.isOn = true
            }
        }
    }

    @IBAction func btnAAction(_ sender: RadioButton) {
        print("btnclick")
        
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
            var selectedStyle:String = ""
            switch index {
            case 0: selectedStyle = "Red"
                    break
            // executable code
            case 1: selectedStyle = "White"
                    break
            // executable code
            case 2: selectedStyle = "Rose"
                    break
                
            case 3: selectedStyle = "Sparkling"
                    break

            case 4: selectedStyle = "Dessert"
                    break

            default:
                    break
                // executable code
            }
            
            let giftBodyVC = GiftBodyVC(nibName: "GiftBodyVC", bundle: nil)
            giftStyleString = selectedStyle
            self.push(viewController: giftBodyVC)
        }
    }
    
    @IBAction func buttonClickedRadio(_ sender: Any) {
        print("btnclick")
    }
    
   

    @IBAction func btnRadioPrressed(sender: RadioButton) {
        
        for btn in arrButtons {
            btn.isSelected = false
            btn.isOn = false
            print("init")
        }
        if let index = arrButtons.index(where: { $0 == sender }) {
            arrButtons[index].isSelected = true
            arrButtons[index].isOn = true
            print("selected")
            print("index=\(arrButtons[index])")
        }
    }

    @IBAction func bckButtonClicked(_ sender: Any) {
        self.dismissViewController(animated: true)

    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        let giftBodyVC = HomeView(nibName: "HomeView", bundle: nil)
        self.push(viewController: giftBodyVC)
        
    }
    @IBAction func homeViewButtonClicked(_ sender: Any) {
        let giftBodyVC = OnlineVC(nibName: "OnlineVC", bundle: nil)
        self.push(viewController: giftBodyVC)
        
    }
}
