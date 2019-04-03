//
//  ViewController.swift
//  TestToolsSwift
//
//  Created by TangYanQiong on 2019/4/3.
//  Copyright © 2019年 TYQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func showAlertPopBy(str: String?) {
        let alert = UIAlertController.init(title: str, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .cancel, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clickBtn(_ sender:UIButton) {
        switch (sender.tag) {
        case 0:
            let tmpStr = String(format: "获取到当前时区:%@，系统语言为:%@", getSystemGMT()!, getCurrentLanguage()!)
            showAlertPopBy(str: tmpStr)
        break;
        case 1:
            ToastTool.showToast(by: "我是一个Toast弹框", in: self.view)
            break;
        case 2:
            let testStr = "\"我是一个短短那份那时的测试长度的字符串，这个是个字符串是的发生的发生的阿的发生的发的说法爱上的发生的发大水的爱上的发的发生\""
            let wordHeight = StringTool.measureStringRect(testStr, width: 300, fontSize: UIFont.systemFont(ofSize: 10)).height
            showAlertPopBy(str: testStr+String(format: "\n\n这段文字当为10字体、300宽度时，计算出高度是：%f", wordHeight))
        break;
        case 3:
            let getImg = ImageTool.createImage(with: UIColor.blue, size: CGSize(width: 250, height: 250))
            let tmpImageView = UIImageView.init(image: getImg)
            tmpImageView.center = self.view.center
            tmpImageView.isUserInteractionEnabled = true
            tmpImageView.tag = 2019
            self.view.addSubview(tmpImageView)
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(removeImageView))
            tmpImageView.addGestureRecognizer(tap)
            
            showAlertPopBy(str: "根据颜色设置CGSize生成图片，点击图片消失")
        break;
        case 4:
            let tmpStr = "dssddd@.com";
            showAlertPopBy(str: tmpStr+String(format: "%@正确的邮箱地址", ValidateTool.validateEmail(tmpStr) ? "是":"不是"))
        break;
        case 5:
            let getImg = ImageTool.createImage(with: ColorTool.color(fromHexRGB: "e6e6e6"), size: CGSize(width: 300, height: 200))
            let tmpImageView = UIImageView.init(image: getImg)
            tmpImageView.center = self.view.center
            tmpImageView.isUserInteractionEnabled = true
            tmpImageView.tag = 2019
            self.view.addSubview(tmpImageView)
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(removeImageView))
            tmpImageView.addGestureRecognizer(tap)
            
            showAlertPopBy(str: "根据RGB颜色设置CGSize生成图片，点击图片消失")
        break;
        default:
            break;
        }
    }
    
    @objc private func removeImageView() {
        let tmpView = view.viewWithTag(2019)
        tmpView?.removeFromSuperview()
    }
}


