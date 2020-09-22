//
//  GiftPriceVC.swift
//  cambridgewines
//
//  Created by Poonam on 03/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class GiftPriceVC: Baseviewcontroller {

    @IBOutlet weak var highRangeRadioButton: RadioButton!
    @IBOutlet weak var lowerMiddleRangeRadioButton: RadioButton!
    @IBOutlet weak var upperMiddleRangeRadioButton: RadioButton!
    @IBOutlet weak var lowerRangeRadioButton: RadioButton!
    @IBOutlet weak var selectionView: UIView!
    
    @IBOutlet weak var lbl2: DesignableLabelView!
    @IBOutlet weak var screen1Button: UIButton!
    @IBOutlet weak var screen2Button: UIButton!
    @IBOutlet weak var screen3Button: UIButton!
    @IBOutlet weak var screen4Button: UIButton!
    var arrayScrrenButtons:[UIButton] = []
    var arrButtons:[RadioButton] = []

    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var stackbottom: UIStackView!
    @IBOutlet weak var viewitems: UIView!
    @IBOutlet weak var stacktop: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrButtons.append(lowerRangeRadioButton)
        arrButtons.append(lowerMiddleRangeRadioButton)
        arrButtons.append(upperMiddleRangeRadioButton)
        arrButtons.append(highRangeRadioButton)
        arrayScrrenButtons.append(screen1Button)
        arrayScrrenButtons.append(screen2Button)
        arrayScrrenButtons.append(screen3Button)
        arrayScrrenButtons.append(screen4Button)
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
        self.lblprice.isHidden = true
        self.selectionView.isHidden = true
        self.viewitems.isHidden = true
        self.stacktop.isHidden = true
        self.stackbottom.isHidden = true
        
        lbl2.setTextWithTypeAnimation(typedText: "What price range are you thinking?", characterDelay: 15)
        
        self.showgiftingview()
        
        if giftPriceRangeString != nil{
            for btn in arrButtons {
                // btn.isSelected = false
                if btn.isOn == true{
                    btn.isOn = false
                }
                print("init")
            }
            if giftPriceRangeString == "<$20"{
                
                lowerRangeRadioButton.isOn = true
                
            }else if giftPriceRangeString == "$20-$40"{
                lowerMiddleRangeRadioButton.isOn = true
            }else if giftPriceRangeString == "$40-$60"{
                upperMiddleRangeRadioButton.isOn = true
            }else if giftPriceRangeString == ">$60"{
                highRangeRadioButton.isOn = true
            }
        }
    
    }
    
    func showgiftingview()
    {
        let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.lblprice.isHidden = false
            self.selectionView.isHidden = false
            self.viewitems.isHidden = false
            self.stacktop.isHidden = false
            self.stackbottom.isHidden = false
        }
    }
    
    @IBAction func scrrenBtnAction(_ sender: UIButton) {
        if let index = arrayScrrenButtons.index(where: { $0 == sender }) {
            if index == 2{
                //  dismissViewController(animated: true)
                let giftBodyVC = GiftFlavorVC(nibName: "GiftFlavorVC", bundle: nil)
                //giftBodyVC.giftStyleString = self.giftStyleString
                
                self.push(viewController: giftBodyVC)
            }else if index == 1{
                let giftBodyVC = GiftBodyVC(nibName: "GiftBodyVC", bundle: nil)
                //giftBodyVC.giftStyleString = self.giftStyleString
                
                self.push(viewController: giftBodyVC)
                
            }else if index == 0{
                let giftBodyVC = GiftVC(nibName: "GiftVC", bundle: nil)
                self.push(viewController: giftBodyVC)
                
            }
        }
    }

    
    
    @IBAction func radioButtonClick(_ sender: RadioButton) {
        
        
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
            var selectedPriceRange = ""
            switch index {
            case 0: selectedPriceRange = "<$20"
                break
            // executable code
            case 1:selectedPriceRange = "$20-$40"
                break
            // executable code
            case 2:selectedPriceRange = "$40-$60"
                break
                
            case 3:selectedPriceRange = ">$60"
                break
                
                
            default:
                break
                // executable code
            }
            let giftBodyVC = ResultVC(nibName: "ResultVC", bundle: nil)
            
            giftPriceRangeString = selectedPriceRange
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
    
    @IBAction func backButtonClicked(_ sender: Any) {
        let giftBodyVC = GiftFlavorVC(nibName: "GiftFlavorVC", bundle: nil)
        self.dismissViewController(animated: true)//po(viewController: giftBodyVC)
    }
    
}
