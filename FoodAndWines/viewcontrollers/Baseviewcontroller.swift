//
//  Baseviewcontroller.swift
//  cambridgewines
//
//  Created by Abhishek Rathi on 25/09/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class Baseviewcontroller: UIViewController {

    @IBOutlet weak var btnsearch: UIButton!
    @IBOutlet weak var btnonline: UIButton!
    @IBOutlet weak var btnhistory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func bntsearchclick(sender: UIButton)
    {
        
    }
    @IBAction func btnonlineclick(sender: UIButton)
    {
        let online  = OnlineVC (nibName: "OnlineVC", bundle: nil)
        self.push(viewController: online)
    }
    @IBAction func btnhistoryclick(sender: UIButton)
    {
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
