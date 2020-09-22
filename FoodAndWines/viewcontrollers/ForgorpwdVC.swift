//
//  ForgorpwdVC.swift
//  sonomaracquets
//
//  Created by Abhishek Rathi on 04/09/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import SwiftyJSON
import SCLAlertView
import Toast_Swift

class ForgorpwdVC: UIViewController {

    @IBOutlet weak var txtemail: DesignableUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.hideNavigationBar()
    }
    @IBAction func btnsubmitclick(_ sender: Any)
    {
        if txtemail.text == ""
        {
            showToast(message: validationstring.email)
            return
        }
    }
    @IBAction func btnloginclick(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
