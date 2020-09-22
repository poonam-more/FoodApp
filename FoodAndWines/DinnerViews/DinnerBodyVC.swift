//
//  DinnerBodyVC.swift
//  cambridgewines
//
//  Created by Poonam on 18/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class DinnerBodyVC: UIViewController {

    @IBOutlet weak var fullRadioButton: RadioButton!
    
    @IBOutlet weak var mediumRadioButton: RadioButton!
    
    
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    @IBOutlet weak var screen5Button: UIButton!
    
    @IBOutlet weak var screenNumberView: UIView!
    @IBOutlet weak var satckView: UIStackView!
    @IBOutlet weak var radioView: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var messageLabel1: DesignableLabelView!
    var arrButtons:[RadioButton] = []
    var arrayScrrenButtons:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrButtons.append(fullRadioButton)
        arrButtons.append(mediumRadioButton)
        
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
        arrayScrrenButtons.append(screen5Button)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.radioView.isHidden = true
        self.satckView.isHidden = true
        self.bodyLabel.isHidden = true
        self.screenNumberView.isHidden = true
        
        messageLabel1.setTextWithTypeAnimation(typedText: "How about the body of wine?", characterDelay: 15)
        
        
        showBodyView()
        if dinnerBodyString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if dinnerBodyString == "Full"{
                
                fullRadioButton.isOn = true
                
            }else if dinnerBodyString == "Medium"{
                mediumRadioButton.isOn = true
            }
        }
    }
    func showBodyView()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.radioView.isHidden = false
            self.satckView.isHidden = false
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
            case 0: selectedStyle = "Full"
                break
            // executable code
            case 1: selectedStyle = "Medium"
                break
            // executable code
           
                
            default:
                break
                // executable code
            }
            
            let giftBodyVC = DinnerFlavorVC(nibName: "DinnerFlavorVC", bundle: nil)
             dinnerBodyString = selectedStyle
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
            if index == 2{
                //  dismissViewController(animated: true)
                let giftBodyVC = DinnerStyleVC(nibName: "DinnerStyleVC", bundle: nil)
                //giftBodyVC.giftStyleString = self.giftStyleString
                
                self.push(viewController: giftBodyVC)
            }else if index == 1{
                let giftBodyVC = HerbsVC(nibName: "HerbsVC", bundle: nil)
                //giftBodyVC.giftStyleString = self.giftStyleString
                
                self.push(viewController: giftBodyVC)
                
            }else if index == 0{
                let giftBodyVC = PrepareVC(nibName: "PrepareVC", bundle: nil)
                self.push(viewController: giftBodyVC)
                
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
