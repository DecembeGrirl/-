//
//  UIlable+Extenstion.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/8/9.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {

    convenience init(title: String , fontSize: CGFloat = 14, color:UIColor = .darkGray) {
        self.init()
        text = title
        font = UIFont.systemFont(ofSize: fontSize)
        textColor = color
    }
    
}
