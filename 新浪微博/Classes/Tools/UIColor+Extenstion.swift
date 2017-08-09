//
//  UIColor+Extenstion.swift
//  微博
//
//  Created by 杨淑园 on 2017/8/2.
//  Copyright © 2017年 杨淑园. All rights reserved.
//
import Foundation
import UIKit

extension UIColor {
    //返回随机颜色
     class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
//    
//   public func  YSHY_Color_RGBValue(value:NSInteger) -> UIColor {
//   
//        return UIColor.init(red: ((CGFloat)((value & 0xFF0000) >> 16)) / 255.0 , green: ((CGFloat)((value & 0xFF0000) >> 8)) / 255.0, blue: (CGFloat)(value & 0xFF0000) / 255.0, alpha: 1)
//    }
//
//   public func YSHY_Color_RGB_Alpha(R:CGFloat,G:CGFloat, B:CGFloat,A:CGFloat) -> UIColor {
//    
//        return UIColor.init(red: R / 255.0 , green: G / 255.0, blue: B / 255.0, alpha: A)
//    }
//    
//    public func YSHY_Color_RGB_Normal (R:CGFloat,G:CGFloat, B:CGFloat,A:CGFloat) -> UIColor{
//        return UIColor.init(red: R / 255.0 , green: G / 255.0, blue: B / 255.0, alpha: 1)
//    }

    
}
