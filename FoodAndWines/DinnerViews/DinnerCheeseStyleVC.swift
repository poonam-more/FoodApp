//
//  DinnerCheeseStyleVC.swift
//  cambridgewines
//
//  Created by Poonam on 18/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class DinnerCheeseStyleVC: UIViewController {

    @IBOutlet weak var dessertRadioButton: RadioButton!
    @IBOutlet weak var sparklingRadioButton: RadioButton!
    @IBOutlet weak var whiteRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    @IBOutlet weak var styleLabel: UILabel!
  
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var screenNumberView: UIView!
    @IBOutlet weak var radioView: UIView!
    
    @IBOutlet weak var stackView2: UILabel!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radioView.isHidden = true
        self.stackView1.isHidden = true
        self.stackView2.isHidden = true
        self.styleLabel.isHidden = true
        self.screenNumberView.isHidden = true
        
        messageLabel2.setTextWithTypeAnimation(typedText: "What style are you thinking of giving?", characterDelay: 15)
        
        
        showStyleView()
        
        arrButtons.append(whiteRadioButton)
        arrButtons.append(dessertRadioButton)
         arrButtons.append(sparklingRadioButton)
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if dinnerCheeseStyleString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerCheeseStyleString == "White"{
                for btn in arrButtons {
                    // btn.isSelected = false
                    if btn.isOn == true{
                        btn.isOn = false
                    }
                    print("init")
                }
                whiteRadioButton.isOn = true
                
            }else if dinnerCheeseStyleString == "Dessert"{
                dessertRadioButton.isOn = true
            }else if dinnerCheeseStyleString == "Sparkling"{
                sparklingRadioButton.isOn = true
            }
        }
    }
    func showStyleView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioView.isHidden = false
            self.stackView1.isHidden = false
            self.stackView2.isHidden = false
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
            case 0: selectedStyle = "White"
                break
            // executable code
            case 1: selectedStyle = "Dessert"
                break
            
            case 2: selectedStyle = "Sparkling"
                break
                
                
            default:
                break
                // executable code
            }
            
            let giftBodyVC = DinnerCheeseBodyVC(nibName: "DinnerCheeseBodyVC", bundle: nil)
              dinnerCheeseStyleString = selectedStyle
            self.push(viewController: giftBodyVC)
        }
    }
    
    @IBAction func scrrenBtnAction(_ sender: UIButton) {
       
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
