//
//  DinnerCheeseBodyVC.swift
//  cambridgewines
//
//  Created by Poonam on 18/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class DinnerCheeseBodyVC: UIViewController {
    @IBOutlet weak var boldRadioButton: RadioButton!
    
    @IBOutlet weak var lightRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var radioView: UIView!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var screenNumberView: UIView!
    @IBOutlet weak var messageLabel2: DesignableLabelView!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrButtons.append(lightRadioButton)
        arrButtons.append(boldRadioButton)
        
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.radioView.isHidden = true
        self.stackView1.isHidden = true
        self.bodyLabel.isHidden = true
        self.screenNumberView.isHidden = true
        
        messageLabel2.setTextWithTypeAnimation(typedText: "How do you think you will prepare it?", characterDelay: 15)
        
        
        showBodyView()
        if dinnerCheeseBodyString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerCheeseBodyString == "Light"{
                for btn in arrButtons {
                    // btn.isSelected = false
                    if btn.isOn == true{
                        btn.isOn = false
                    }
                    print("init")
                }
                lightRadioButton.isOn = true
                
            }else if dinnerCheeseBodyString == "Bold"{
                boldRadioButton.isOn = true
            }
        }
    }
    func showBodyView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioView.isHidden = false
            self.stackView1.isHidden = false
            self.bodyLabel.isHidden = false
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
            case 0: selectedStyle = "Light"
                break
            // executable code
            case 1: selectedStyle = "Bold"
                break
            
           
            default:
                break
                
            }
            
            let giftBodyVC = ResultVC(nibName: "ResultVC", bundle: nil)
            dinnerCheeseBodyString = selectedStyle
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
                dismissViewController(animated: true)
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
