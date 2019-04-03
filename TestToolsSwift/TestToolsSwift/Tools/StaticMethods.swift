//  
//
//  StaticMethods.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 2017/4/14.
//  Copyright © 2017Year . All rights reserved.
//

import UIKit

let SINGLE_LINE_WIDTH = 1 / UIScreen.main.scale
let SINGLE_LINE_ADJUST_OFFSET = (1 / UIScreen.main.scale) / 2

//Get safe space string
@inline(__always) func GetSafeString(str: String?) -> String? {
    var str = str
    if str == nil {
        str = ""
    }
    return str
}

@inline(__always) func DrawHorizontalLine(view: UIView?, x: Float, y: Float, lineWidth: Float, color: UIColor?) -> Bool {
    let lineLayer = CALayer()
    lineLayer.backgroundColor = color?.cgColor
    lineLayer.frame = CGRect(x: CGFloat(x), y: CGFloat(y) - SINGLE_LINE_ADJUST_OFFSET, width: CGFloat(lineWidth), height: SINGLE_LINE_WIDTH)
    view?.layer.addSublayer(lineLayer)

    return true
}

@inline(__always) func DrawLine(view: UIView?, x: Float, y: Float, lineWidth: Float, lineHeight: Float, color: UIColor?) -> Bool {
    let lineLayer = CALayer()
    lineLayer.backgroundColor = color?.cgColor
    lineLayer.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(lineWidth), height: CGFloat(lineHeight))
    view?.layer.addSublayer(lineLayer)

    return true
}

// MARK: Get system langue
@inline(__always) func getCurrentLanguage() -> String? {
    let languages = NSLocale.preferredLanguages
    var currentLanguage = languages[0]
    /* 根据实际需要给到服务器数据
    if Int((currentLanguage as NSString).range(of: "zh-Hans").location) != NSNotFound {
        currentLanguage = "zh_CN"
    } else if Int((currentLanguage as NSString).range(of: "zh-Hant").location) != NSNotFound || Int((currentLanguage as NSString).range(of: "zh-HK").location) != NSNotFound || Int((currentLanguage as NSString).range(of: "zh-TW").location) != NSNotFound {
        currentLanguage = "zh_TW"
    } else {
        currentLanguage = "en_US"
    }
     */
    return currentLanguage
}

@inline(__always) func getSystemGMT() -> String? {
    let timezone = NSTimeZone.system as NSTimeZone
    return String(format: "%ld", timezone.secondsFromGMT / (60 * 60))
}


//Remove space and enter
@inline(__always) func RemoveSpaceAndEnter(str: String?) -> String? {
    var str = str
    if str == nil || (str?.count ?? 0) == 0 {
        str = ""
    } else {
        str = str?.trimmingCharacters(in: CharacterSet.whitespaces)
        str = str?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    return str
}

@inline(__always) func isEmptyString(judgeStr: String?) -> Bool {
    if judgeStr == nil {
        return true
    }
    if (judgeStr?.count ?? 0) == 0 {
        return true
    }

    return false
}
