//
//  UIBarItem+Extension.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/8/9.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    // 重载init方法
    convenience init(title:String,fontSize:CGFloat = 16,target:AnyObject?, action: Selector,isBack:Bool = false) {
        
        let btn :UIButton = UIButton.init(title:title,fontSize:fontSize,normalColor:.darkGray,highlightedColor:.orange)
//btn.YHSY_init(title:title,fontSize:fontSize,normalColor:.darkGray,highlightedColor:.orange)
        btn.addTarget(target,action:action,for:.touchUpInside)
        if(isBack){
            let imgName = "nav_back_icon"
            btn.setImage((UIImage.init(named: imgName)), for: .normal)
            btn.setImage((UIImage.init(named: imgName+"_highlighted")), for: .highlighted)
        }
        btn.sizeToFit()
        
        self.init(customView:btn)
    }
   
    
    
    
}
