//  
//
//  ColorTool.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 2017/4/14.
//  Copyright © 2017Year . All rights reserved.
//

import Foundation

//Create UIColor form HexString
class ColorTool: NSObject {
    class func color(fromHexRGB inColorString: String?) -> UIColor? {
        var string = ""
        if (inColorString?.lowercased().hasPrefix("0x"))! {
            string = (inColorString?.replacingOccurrences(of: "0x", with: ""))!
        } else if (inColorString?.hasPrefix("#"))! {
            string = (inColorString?.replacingOccurrences(of: "#", with: ""))!
        } else {
            string = inColorString!
        }
        
        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }
        
        guard let hexValue = Int(string, radix: 16) else { return nil }
    
        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        
        let result = UIColor(red: CGFloat(Float(red) / 0xff), green: CGFloat(Float(green) / 0xff), blue: CGFloat(Float(blue) / 0xff), alpha: 1.0)
        return result
    }
}
