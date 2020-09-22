//
//  Constants.swift
//  Aeryus
//
//  Created by Wang Gang on 9/12/18.
//  Copyright © 2018 Aeryus. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let appdelegate = UIApplication.shared.delegate as! AppDelegate
let IsIPhoneX = UIScreen.main.nativeBounds.height == 2436

let ScreenRatio = ScreenWidth / 375

class Constants {
    
#if DEBUG
    static let baseUrl = "http://mobilecamerapro.com/webservice/"
#else
    static let baseUrl = "http://mobilecamerapro.com/webservice/"
#endif
    
    //static let googlemapapikey = "AIzaSyDlhqG2dqCH-vJ4F1u7ZuzE5a6EjonbK70"
    
    static let googlemapapikey = "AIzaSyC-Rp-uViWe-c9GXCfIjZMngqDbOGy1D2A"
    static let apiheadername = "X-API-KEY"
    static let apiheaderkey = "10d7e45a4e1ec226b12d3d1ffa8d946638e688c3"
    static let devicetype = "A"
    static let pagerecordsize = 10
    
    //washington dc lat lng
//    static let Default_start_lat = 38.891688
//    static let  Default_start_lng = -77.023070
//
      static let Default_start_lat = 26.238947
      static let  Default_start_lng = 73.024307
      static let dateformat  = "dd-MMM-yyyy"
    
    static let safeareabottomheight  = 84
    
    struct Notifications {
        static let connectionLost = "aeryus-connection-lost"
        static let connectionAvailable = "aeryus-connection-available"
    }
    
    static let isSimulator: Bool = {
        var isSim = false
    #if arch(i386) || arch(x86_64)
        isSim = true
    #endif
        return isSim
    }()
    
    static let navBarHeight: CGFloat = 44
    static let statusBarHeight: CGFloat = 20
    
    static let SideMenuWidth: CGFloat = ScreenWidth * 0.8
}
