//
//  YSHYTools.swift
//  微博
//
//  Created by 杨淑园 on 2017/8/7.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
/***************字体******************/
// 系统普通字体
var YSHY_Font_Sys: (CGFloat) -> UIFont = { size in
    
    return UIFont.systemFont(ofSize: size)
}
// 粗体
var YSHY_Font_Blod: (CGFloat) -> UIFont = { size in
    return UIFont.boldSystemFont(ofSize:size)
}
// 斜体
var YSHY_Font_Italic: (CGFloat) -> UIFont = { size in
    return UIFont.italicSystemFont(ofSize:size)
}
//
var YSHY_Font_NameAndSize: (String,CGFloat) -> UIFont = { name,size in
    return UIFont.init(name: name,size:size)!
}

/*********************颜色*************************/

var YSHY_Color_RGB_Alpha: (CGFloat,CGFloat, CGFloat,CGFloat) -> UIColor = {R ,G , B ,A in
    return UIColor.init(red: R / 255.0 , green: G / 255.0, blue: B / 255.0, alpha: A)
}

var YSHY_Color_RGB_Normal: (CGFloat,CGFloat, CGFloat) -> UIColor = {R ,G , B  in
    return UIColor.init(red: R / 255.0 , green: G / 255.0, blue: B / 255.0, alpha: 1)
}
// 16进制
var YSHY_Color_RGBValue: (NSInteger) -> UIColor = {value  in
    return UIColor.init(red: ((CGFloat)((value & 0xFF0000) >> 16)) / 255.0 , green: ((CGFloat)((value & 0xFF0000) >> 8)) / 255.0, blue: (CGFloat)(value & 0xFF0000) / 255.0, alpha: 1)
}

// 使用颜色字符串
var YSHY_Color_RGBSTR:(String) -> UIColor = {value in
    // 存储转换后的数值
     let hexValue = UInt(String(value.characters.suffix(6)), radix: 16)
        return UIColor.init(red: ((CGFloat)((hexValue! & 0xFF0000) >> 16)) / 255.0 , green: ((CGFloat)((hexValue! & 0xFF0000) >> 8)) / 255.0, blue: (CGFloat)(hexValue! & 0xFF0000) / 255.0, alpha: 1)
}


let YSHY_Color_BackGround_1:UIColor = YSHY_Color_RGB_Normal(248,248,248)
/********************CGRect***********************************/

var YSHY_CGR_Make:(CGFloat,CGFloat, CGFloat,CGFloat) ->CGRect = {x,y,width,height in
    return CGRect(x: x, y: y, width: width, height: height)
}


let CONTEXTWIDTH:CGFloat = UIScreen.main.bounds.size.width
let CONTEXTHEIGHT:CGFloat = UIScreen.main.bounds.size.height




