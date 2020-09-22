//
//  StringTable.swift
//  Aeryus
//
//  Created by Wang Gang on 9/12/18.
//  Copyright © 2018 Aeryus. All rights reserved.
//

import Foundation

class StringTable {
    
    public static let TAG = "RoadRez"
    
    // SERVER CONNECTION
    public static let CONN_ERROR_TAG = "Something went wrong"
    public static let CONN_ERROR_MESSAGE = "We are currently experiencing technical difficulties, please try again later."
    
}
class GlobalVariables
{
    
    // These are the properties you can store in your singleton
    public var devicetkn: String = " "
    public var loginuserid: String = " "
    public var loginusertype: String = " "
    public var token: String = " "
    
    public var isemailverified: String = ""
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
