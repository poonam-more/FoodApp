//
//  HerbsVC.swift
//  cambridgewines
//
//  Created by Poonam on 17/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class HerbsVC: UIViewController {
    @IBOutlet weak var blackPaperRadioButton: RadioButton!
    
    @IBOutlet weak var herbRadioButton: RadioButton!
    
    @IBOutlet weak var redPepperRadionButton: RadioButton!
    
    @IBOutlet weak var spicesRadioButton: RadioButton!
    
    @IBOutlet weak var exoSpicesRadioButton: RadioButton!
    @IBOutlet weak var hotSpicesRadioButton: RadioButton!
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    @IBOutlet weak var screen5Button: UIButton!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    
    @IBOutlet weak var herbsLabel: UILabel!
    @IBOutlet weak var screenNumberView: UIView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var radioView: UIView!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    @IBOutlet weak var stackView1: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        arrButtons.append(blackPaperRadioButton)
        arrButtons.append(herbRadioButton)
        arrButtons.append(redPepperRadionButton)
        arrButtons.append(spicesRadioButton)
        arrButtons.append(exoSpicesRadioButton)
        arrButtons.append(hotSpicesRadioButton)
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
        arrayScrrenButtons.append(screen5Button)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.radioView.isHidden = true
        self.stackView1.isHidden = true
        self.stackView2.isHidden = true
        self.herbRadioButton.isHidden = true
        self.screenNumberView.isHidden = true
         self.herbsLabel.isHidden = true
        messageLabel1.setTextWithTypeAnimation(typedText: "Are you adding any herbs or spices?", characterDelay: 15)
    
        showHerbsView()
        if dinnerHerbsString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerHerbsString == "BlackPepper"{
                
                blackPaperRadioButton.isOn = true
                
            }else if dinnerHerbsString == "Herbs"{
                herbRadioButton.isOn = true
            }else if dinnerHerbsString == "RedPepper"{
                redPepperRadionButton.isOn = true
            }else if dinnerHerbsString == "Spices"{
                spicesRadioButton.isOn = true
            }else if dinnerHerbsString == "ExoticSpices"{
                exoSpicesRadioButton.isOn = true
            }else if dinnerHerbsString == "HotSpicy"{
                hotSpicesRadioButton.isOn = true
            }
        }
    }
    func showHerbsView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioView.isHidden = false
            self.stackView1.isHidden = false
            self.stackView2.isHidden = false
            self.herbRadioButton.isHidden = false
            self.screenNumberView.isHidden = false
            self.herbsLabel.isHidden = false

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
            case 0: selectedStyle = "BlackPepper"
                break
            // executable code
            case 1: selectedStyle = "Herbs"
                break
            // executable code
            case 2: selectedStyle = "RedPepper"
                break
                
            case 3: selectedStyle = "Spices"
                break
                
            case 4: selectedStyle = "ExoticSpices"
                break
                
            case 5: selectedStyle = "HotSpicy"
                break
                
            default:
                break
                // executable code
            }
            
            let giftBodyVC = DinnerStyleVC(nibName: "DinnerStyleVC", bundle: nil)
            dinnerHerbsString = selectedStyle
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
