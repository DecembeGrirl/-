//
//  UIButton+Extension.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/8/9.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit
extension UIButton {
    
    func YHSY_init(title:String, fontSize: CGFloat = 16 ,normalColor:UIColor,highlightedColor:UIColor){
        setTitle(title, for: .normal);
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        setTitleColor(normalColor, for: .normal)
        setTitleColor(highlightedColor, for: .highlighted)
//        return self;
    }


}
