//
//  Validator.swift
//  Aeryus
//
//  Created by David Bala on 17/09/2018.
//  Copyright © 2018 Aeryus. All rights reserved.
//

import Foundation

/**
 Defined several validators
 Available for now: email, phone number, confirm password, password length, user name
 
 - Authors: David Bala
 */
class Validator {
    
    /* Email validator */
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    /* custom phone number validator */
   static func isValidMobile(mobile:String) -> Bool {
    if mobile.count >= 12 {
        return true
    } else {
        return false
    }
    }
    
    /* Phone number validator */
    static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phoneNumber)
        return result
    }
    
    /* Password checker */
    static func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword {
            return true
        } else {
            return false
        }
    }
    
    /* Password strength checker */
    static func isValidPasswordLenth(password: String, minLen: Int) -> Bool {
        if password.count >= minLen {
            return true
        } else {
            return false
        }
    }
    
    /* User name validator */
    static func isValidAppUserName(appUserName: String) -> Bool {
        let USERNAME_REGEX = "^\\w{3,18}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", USERNAME_REGEX)
        let result =  userNameTest.evaluate(with: appUserName)
        return result
    }
    
    
    static func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XXX-XXX-XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
   static func UTCToLocal(date:String, fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = toFormat
        
        return dateFormatter.string(from: dt!)
    }
    
    static func gettimeformat() -> String
    {
    let locale = NSLocale.current
    let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
         var timeformat = ""
         if formatter.contains("a")
         {
           timeformat = "hh:mm"
         }
         else
         {
          print("phone is set to 24 hours")
          timeformat = "HH:mm"
         }
      return timeformat
    }
}
