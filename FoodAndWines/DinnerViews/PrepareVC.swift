//
//  PrepareVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class PrepareVC: UIViewController {
    @IBOutlet weak var roastRadioButton: RadioButton!
    
    @IBOutlet weak var smokeRadioButton: RadioButton!
    
    @IBOutlet weak var grillRadionButton: RadioButton!
    
    @IBOutlet weak var sauteRadioButton: RadioButton!
    
    @IBOutlet weak var steamRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    @IBOutlet weak var screen5Button: UIButton!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    @IBOutlet weak var screenNumberView: UIView!
    
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var radioBtnView: UIView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var preparationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrButtons.append(roastRadioButton)
        arrButtons.append(smokeRadioButton)
        arrButtons.append(sauteRadioButton)
        arrButtons.append(grillRadionButton)
        arrButtons.append(steamRadioButton)
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
        arrayScrrenButtons.append(screen5Button)
    }

     override func viewWillAppear(_ animated: Bool) {
        self.radioBtnView.isHidden = true
        self.stackView1.isHidden = true
        self.stackView2.isHidden = true
        self.preparationLabel.isHidden = true
        self.screenNumberView.isHidden = true
       
        messageLabel1.setTextWithTypeAnimation(typedText: "How do you think you will prepare it?", characterDelay: 15)
        
        
        showPrepareView()
        
        if dinnerPrepareString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerPrepareString == "Roasted"{
                for btn in arrButtons {
                    // btn.isSelected = false
                    if btn.isOn == true{
                        btn.isOn = false
                    }
                    print("init")
                }
                roastRadioButton.isOn = true
                
            }else if dinnerPrepareString == "Smoked"{
                smokeRadioButton.isOn = true
            }else if dinnerPrepareString == "Sauted"{
                sauteRadioButton.isOn = true
            }else if dinnerPrepareString == "Grilled"{
                grillRadionButton.isOn = true
            }else if dinnerPrepareString == "Steamed"{
                steamRadioButton.isOn = true
            }
        }
    
     }
    func showPrepareView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioBtnView.isHidden = false
            self.stackView1.isHidden = false
            self.stackView2.isHidden = false
            self.preparationLabel.isHidden = false
            self.screenNumberView.isHidden = false
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
            case 0: selectedStyle = "Roasted"
                break
            // executable code
            case 1: selectedStyle = "Smoked"
                break
            // executable code
            case 2: selectedStyle = "Sauted"
                break
                
            case 3: selectedStyle = "Grilled"
                break
                
            case 4: selectedStyle = "Steamed"
                break
                
            default:
                break
                // executable code
            }
            
            let giftBodyVC = HerbsVC(nibName: "HerbsVC", bundle: nil)
            dinnerPrepareString = selectedStyle
            self.push(viewController: giftBodyVC)
        }
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
