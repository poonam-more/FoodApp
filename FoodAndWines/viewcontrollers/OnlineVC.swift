//
//  OnlineVC.swift
//  cambridgewines
//
//  Created by Abhishek Rathi on 25/09/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class OnlineVC: Baseviewcontroller {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func searchButtonClicked(_ sender: Any) {
        let giftVC = HomeView(nibName: "HomeView", bundle: nil)
        self.push(viewController: giftVC)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
