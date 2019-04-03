//  
//
//  ValidateTool.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 2017/4/14.
//  Copyright © 2017Year . All rights reserved.
//

import Foundation

class ValidateTool: NSObject {
    class func validateUserName(_ userStr: String?) -> Bool {
        let emailReg = "[A-Z0-9a-z_.]+@[A-Za-z0-9_.]+\\.[A-Za-z]{2,4}"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailReg)

        let phoneReg = "1[3|5|8]\\d{9}"
        let phoneCheck = NSPredicate(format: "SELF MATCHES %@", phoneReg)

        if emailCheck.evaluate(with: userStr) || phoneCheck.evaluate(with: userStr) {
            return true
        } else {
            return false
        }
    }

    class func validatePassword(_ password: String?) -> Bool {
        let pattern = "^[0-9a-zA-Z]{6,20}$"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch: Bool = pred.evaluate(with: password)
        return isMatch
    }

    class func validatePhoneNum(_ mobileNum: String?) -> Bool {
        let MOBILE = "^[0-9]{2,5}[0-9]{1,4}[0-9]{4}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@", MOBILE)
        return regextestmobile.evaluate(with: mobileNum)
    }

    class func validateJPLan(_ jpLan: String?) -> Bool {
        let birthDateRegex = "^^[ァ-ヶ]+$"
        let result = NSPredicate(format: "SELF MATCHES %@", birthDateRegex)
        return result.evaluate(with: jpLan)
    }

    class func validateEmail(_ email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }

    class func validateBirthDate(_ birthDate: String?) -> Bool {
        let birthDateRegex = "^[0-9]{4}-[0-9]{2}-[0-9]{2}$"
        let result = NSPredicate(format: "SELF MATCHES %@", birthDateRegex)
        return result.evaluate(with: birthDate)
    }

    class func checkCardNo(_ cardNo: String?) -> Bool {
        var oddsum: Int = 0
        var evensum: Int = 0
        var allsum: Int = 0
        let cardNoLength: Int = cardNo?.count ?? 0
        let lastNum = Int((cardNo! as NSString).substring(from: cardNoLength-1) ) ?? 0
        
        var i = cardNoLength - 1
        while i >= 1 {
            let tmpString = (cardNo as NSString?)?.substring(with: NSRange(location: i - 1, length: 1))
            var tmpVal = Int(tmpString  ?? "") ?? 0
            if cardNoLength % 2 == 1 {
                if (i % 2) == 0 {
                    tmpVal *= 2
                    if tmpVal >= 10 {
                        tmpVal -= 9
                    }
                    evensum += tmpVal
                } else {
                    oddsum += tmpVal
                }
            } else {
                if (i % 2) == 1 {
                    tmpVal *= 2
                    if tmpVal >= 10 {
                        tmpVal -= 9
                    }
                    evensum += tmpVal
                } else {
                    oddsum += tmpVal
                }
            }
            i -= 1
        }
        
        allsum = oddsum + evensum
        allsum += lastNum
        if (allsum % 10) == 0 {
            return true
        } else {
            return false
        }
    }
}
