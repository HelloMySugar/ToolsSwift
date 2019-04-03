//  
//
//  ToastTool.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 2017/4/14.
//  Copyright © 2017Year . All rights reserved.
//

import Foundation
import UIKit

class ToastTool: NSObject {
    //Show toast with message
    @objc class func showToast(by str: String?, in superView: UIView?) {
        //如果父视图为nil，则return
        //If superview is nil, then return
        if superView == nil {
            return
        }

        let hud = MBProgressHUD.showAdded(to: superView!, animated: true) as MBProgressHUD
        hud.isUserInteractionEnabled = false
        hud.mode = MBProgressHUDMode.init(5)
        hud.detailsLabelText = str ?? ""
        hud.margin = 10.0
        hud.layer.cornerRadius = 5.0
        hud.removeFromSuperViewOnHide = true
        hud.hide(true, afterDelay: 1.5)
    }
    
    @objc class func onlyShowTipsAlert(title: String?, content: String?, btnTitle: String?){
        let alert = UIAlertController(title:title,message:content,preferredStyle:UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:(btnTitle?.count ?? 0)! > 0 ? btnTitle : "OK", style:.default,handler:nil)
        alert.addAction(okAction)
        var topRootViewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while ((topRootViewController?.presentedViewController) != nil) {
            topRootViewController = topRootViewController?.presentedViewController
        }
        topRootViewController?.present(alert, animated: true, completion: nil)
    }
}
