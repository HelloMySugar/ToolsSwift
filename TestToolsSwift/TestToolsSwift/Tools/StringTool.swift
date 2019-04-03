
//
//  ShareMethods.m
//  Help_Help
//
//  Created by TangYanQiong Corporation on 13-5-6.
//  Copyright (c) 2013Year TangYanQiong Corporation. All rights reserved.
//

import Foundation
import ObjectiveC
import UIKit

class StringTool: NSObject {
    @objc class func measureStringRect(_ string: String?, width: CGFloat, fontSize: UIFont?) -> CGSize {
        var stringRect: CGRect? = nil
        if let aSize = fontSize {
            stringRect = string?.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: aSize], context: nil)
        }
        return stringRect?.size ?? CGSize.zero
    }

    @objc class func measureStringRect(_ string: String?, height: CGFloat, fontSize: UIFont?) -> CGSize {
        var stringRect: CGRect? = nil
        if let aSize = fontSize {
            stringRect = string?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: aSize], context: nil)
        }
        return stringRect?.size ?? CGSize.zero
    }
    
    @objc class func isURL(_ judgeUrl: String?) -> Bool {
        var url = judgeUrl
        if (url?.count ?? 0) < 1 {
            return false
        }
        if (url?.count ?? 0) > 4 && (((url as NSString?)?.substring(to: 4)) == "www.") {
            url = "http://\(url ?? "")"
        }
        
        let urlRegex = "(https|http|ftp|rtsp|igmp|file|rtspt|rtspu)://((((25[0-5]|2[0-4]\\d|1?\\d?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1?\\d?\\d))|([0-9a-z_!~*'()-]*\\.?))([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\.([a-z]{2,6})(:[0-9]{1,4})?([a-zA-Z/?_=]*)\\.\\w{1,5}"
        
        let urlTest = NSPredicate(format: "SELF MATCHES %@", urlRegex)
        
        return urlTest.evaluate(with: url)
    }
    
    @objc class func getURLFromStr(_ string: String?) -> [Any]? {
        let regulaStr = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
        
        let regex = try? NSRegularExpression(pattern: regulaStr, options: .caseInsensitive)
        
        let arrayOfAllMatches = regex?.matches(in: string ?? "", options: [], range: NSRange(location: 0, length: string?.count ?? 0))
        
        var arr: [AnyHashable] = []
        
        for match: NSTextCheckingResult? in arrayOfAllMatches ?? [] {
            var substringForMatch: String = ""
            if let aRange = match?.range {
                substringForMatch = (string as NSString?)?.substring(with: aRange) ?? ""
            }
            if substringForMatch.count == 0 {
                break
            }
            arr.append(substringForMatch)
        }
        return arr
    }
    
    @objc class func formartToDecimal(by num: Int) -> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        let changeStr = format.string(from: NSNumber(value: num))
        return changeStr!
    }
    
    @objc class func addSpaceToCardNo(_ string: String) -> String {
        if string.count == 0 {
            return string
        }
        
        let changeString = string.replacingOccurrences(of: " ", with: "")
        
        /* add secret function
        if string.count > 12{
            var temp = ""
            for _ in 0...11 {
                temp = temp+"●"
            }
            let lastTmp = (string as NSString).substring(from: 12)
            changeString = temp+lastTmp
        }else{
            var temp = ""
            for _ in 0...string.count-1 {
                temp = temp+"●"
            }
            changeString = temp
        }
        */
        
        var cardNo = changeString as NSString
        var temp1 = ""
        var temp2 = ""
        var temp3 = ""
        var temp4 = ""
        var last = ""
        if cardNo.length >= 4 {
            temp1 = cardNo.substring(with: NSMakeRange(0, 4))+" "
            cardNo = cardNo.substring(from: 4) as NSString
        }else{
            last = cardNo as String
        }
        if cardNo.length >= 4 {
            temp2 = cardNo.substring(with: NSMakeRange(0, 4))+" "
            cardNo = cardNo.substring(from: 4) as NSString
        }else{
            last = cardNo as String
        }
        if cardNo.length >= 4 {
            temp3 = cardNo.substring(with: NSMakeRange(0, 4))+" "
            cardNo = cardNo.substring(from: 4) as NSString
        }else{
            last = cardNo as String
        }
        if cardNo.length >= 4 {
            temp4 = cardNo.substring(with: NSMakeRange(0, 4))
            cardNo = cardNo.substring(from: 4) as NSString
        }else{
            last = cardNo as String
        }
        
        let spaceCardNo = temp1+temp2+temp3+temp4+last
        return spaceCardNo
    }
}
