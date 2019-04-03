//  
//
//  ImageTool.swift
//  MKTV
//
//  Created by TangYanQiong Corporation on 2017/4/14.
//  Copyright © 2017Year . All rights reserved.
//

import Foundation

class ImageTool: NSObject {
    //Create Image By Color
    class func createImage(with color: UIColor?, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor((color?.cgColor)!)
        context?.fill(rect)

        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    // MARK: - image scale utility -
    class func scale(_ image: UIImage?, toWidth: Int, toHeight: Int) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: CGFloat(toWidth), height: CGFloat(toHeight)))
        image?.draw(in: CGRect(x: 0, y: 0, width: CGFloat(toWidth), height: CGFloat(toHeight)))
        let scaledImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage
    }
    
    class func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
