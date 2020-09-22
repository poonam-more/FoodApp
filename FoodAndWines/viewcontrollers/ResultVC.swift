//
//  ResultVC.swift
//  cambridgewines
//
//  Created by Poonam on 03/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class ResultVC: Baseviewcontroller {

    

    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

     //   labelResult.text = "\(giftStyleString!), \(giftBodyString!), \(giftFlavorString!), \(giftPriceRangeString!)"
        
        // Do any additional setup after loading the view.
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
