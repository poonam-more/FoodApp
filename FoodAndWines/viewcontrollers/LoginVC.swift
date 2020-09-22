//
//  LoginVC.swift
//  RoadRez
//
//  Created by Abhishek Rathi on 24/06/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import SwiftyJSON
import SCLAlertView
import Toast_Swift

class LoginVC: UIViewController {

    @IBOutlet weak var txtusername: DesignableUITextField!
    @IBOutlet weak var txtpwd: DesignableUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        self.hideNavigationBar()
    }
    
    @IBAction func btnforgotclick(_ sender: Any) {
        
        let forgotpwd = ForgorpwdVC(nibName: "ForgorpwdVC", bundle: nil)
        self.push(viewController: forgotpwd)
    }
    @IBAction func btnsigninclick(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.toHome()
//        if txtusername.text == ""
//        {
//            showToast(message: validationstring.username)
//            return
//        }
//        if txtpwd.text == ""
//        {
//            showToast(message: validationstring.password)
//            return
//        }
//        else
//        {
//            login()
//        }
    }
    @objc private func login1() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.toHome()
        return
    }
    
    func login ()
    {
        
        let home  = HomeView (nibName: "HomeView", bundle: nil)
        self.push(viewController: home)
        
       //  appdelegate.createSlidingMenu()
        
//        let parameters = [
//            "username": self.txtusername.text ?? "",
//            "password" : self.txtpwd.text ?? "",
//            "devicetoken" : "654165464564fdsfsdf",
//            "devicetype" : Constants.devicetype
//        ]
//        let apiurl = Constants.baseUrl + "login"
//
//        MBProgressHUD.showAdded(to: self.view, animated: true)
//
//        let headers: HTTPHeaders = [
//             Constants.apiheadername: Constants.apiheaderkey,
//        ]
//
//        Alamofire.request(apiurl, method:.post, parameters:parameters,encoding: URLEncoding.default, headers: headers ).responseJSON { response in
//            switch response.result {
//            case .success:
//                MBProgressHUD.hide(for: self.view, animated: true)
//
//                let swiftyJsonVar = JSON(response.result.value!)
//
//                print(swiftyJsonVar)
//                if let status = swiftyJsonVar["status"].string
//                {
//                    print (status)
//                    if status == "S"
//                    {
//                        self.validateloginresponse(respjson: swiftyJsonVar)
//
//                    }
//                    else if (status == "SE")
//                    {
//                        let alertController = UIAlertController(title: "Error", message:
//                            swiftyJsonVar["message"].string!, preferredStyle: .alert)
//
//                        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
//                            //run your function here
//                            self.validateloginresponse(respjson: swiftyJsonVar)
//                        }))
//                        self.present(alertController, animated: true, completion: nil)
//                     }
//                    else
//                    {
//                        self.showToast(message: swiftyJsonVar["message"].string!)
//
//                    }
//                }
//            case .failure(let encodingError):
//                MBProgressHUD.hide(for: self.view, animated: true)
//                print(encodingError)
//                if let err = encodingError as? URLError, err.code  == URLError.Code.notConnectedToInternet{
//                    //self.showAlert(title: "Error", message: StringTable.CONN_ERROR_MESSAGE)
//                }
//                else
//                {
//                    // your other errors
//                }
//                break
//            }
//        }
    }
 
//    func validateloginresponse (respjson : JSON)
//    {
//        print (respjson)
//        let resparr = respjson["data"].arrayValue
//        let ismobileverifieid = resparr[0]["ismobileverified"].stringValue
//        if(ismobileverifieid == "N")
//        {
//            let mobileverify  = VerifymobileVC (nibName: "VerifymobileVC", bundle: nil)
//            mobileverify.memberid = resparr[0]["memberid"].stringValue
//            mobileverify.mobileno = resparr[0]["phone"].stringValue
//            self.push(viewController: mobileverify)
//        }
//        else
//        {
//            DbHandler.deleteDatafromtable("delete from tbluser")
//         
//            GlobalVariables.sharedManager.loginuserid  = resparr[0]["memberid"].stringValue
//            GlobalVariables.sharedManager.loginusertype  =  resparr[0]["membertype"].stringValue
//            GlobalVariables.sharedManager.token = resparr[0]["token"].stringValue
//            
//            DbHandler.insertuser(resparr[0]["memberid"].stringValue, membertype: resparr[0]["membertype"].stringValue, username: resparr[0]["username"].stringValue, email: resparr[0]["email"].stringValue, phone: resparr[0]["phone"].stringValue, password: txtpwd.text, ismobileverified: resparr[0]["ismobileverified"].stringValue, token: resparr[0]["token"].stringValue, profilepicture: resparr[0]["memberprofileimage"].stringValue, vehiclepicture: resparr[0]["memberlastvehiclephoto_large"].stringValue, vehiclenumber: resparr[0]["settingvehiclenums"].stringValue, jobapply: resparr[0]["settingjobapply"].stringValue, locationupdate: resparr[0]["locationupdate"].stringValue, jobstatus: resparr[0]["jobstatus"].stringValue, applycount: resparr[0]["applycount"].stringValue, notificationcount: resparr[0]["notificationcount"].stringValue)
//            
//                appdelegate.createSlidingMenu()
//        }
//    }
    
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

extension UIViewController {
    func showToast(message: String)
    {
            var style = ToastStyle()
            style.backgroundColor = UIColor.white
            style.messageColor = .black
            self.view.makeToast( message, duration: 1.0, position: .bottom, style: style)
    }
}

