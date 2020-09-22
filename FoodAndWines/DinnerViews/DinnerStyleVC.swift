//
//  DinnerStyleVC.swift
//  cambridgewines
//
//  Created by Poonam on 18/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class DinnerStyleVC: UIViewController {

    @IBOutlet weak var redRadioButton: RadioButton!
    
    @IBOutlet weak var whiteRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    @IBOutlet weak var screen5Button: UIButton!
    
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    @IBOutlet weak var screenNumberView: UIView!
    @IBOutlet weak var satckView: UIStackView!
    @IBOutlet weak var radioLabel: UIView!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrButtons.append(redRadioButton)
        arrButtons.append(whiteRadioButton)
        
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
        arrayScrrenButtons.append(screen5Button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.radioLabel.isHidden = true
        self.satckView.isHidden = true
        self.styleLabel.isHidden = true
        self.screenNumberView.isHidden = true
        
        messageLabel1.setTextWithTypeAnimation(typedText: "Which style of wine do you prefer?", characterDelay: 15)
        showStyleView()
        if dinnerStyleString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerStyleString == "Red"{
                for btn in arrButtons {
                    // btn.isSelected = false
                    if btn.isOn == true{
                        btn.isOn = false
                    }
                    print("init")
                }
                redRadioButton.isOn = true
                
            }else if dinnerStyleString == "White"{
                whiteRadioButton.isOn = true
                
            }
        }
    }
    
    func showStyleView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioLabel.isHidden = false
            self.satckView.isHidden = false
            self.styleLabel.isHidden = false
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
            case 0: selectedStyle = "Red"
                break
            // executable code
            case 1: selectedStyle = "White"
                break
          
            default:
                break
                // executable code
            }
            
            let giftBodyVC = DinnerBodyVC(nibName: "DinnerBodyVC", bundle: nil)
            dinnerStyleString = selectedStyle
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
            if index == 0{
                let giftBodyVC = PrepareVC(nibName: "PrepareVC", bundle: nil)
                self.push(viewController: giftBodyVC)
                
            } else if index == 1{
                let giftBodyVC = HerbsVC(nibName: "HerbsVC", bundle: nil)
                self.push(viewController: giftBodyVC)
                //  dismissViewController(animated: true)
            }
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
