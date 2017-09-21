//
//  YSHYWBNavController.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/7/29.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit

class YSHYWBNavController: UINavigationController {
    // 自定义导航条

    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if(childViewControllers.count >= 1)
        {
            // push 的时候 隐藏底部的TabBar
            viewController.hidesBottomBarWhenPushed = true
            if let  vc = viewController as? YSHYWBBaseViewController  {
                //根据push的基数来判断返回按按钮的title
                let title = childViewControllers.count>=2 ?"返回":viewControllers.first?.title
                
                vc.navItem.leftBarButtonItem =  UIBarButtonItem.init(title:title!, target: self, action: #selector(popToBack),isBack:true)
            }
           
        }
       
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func popToBack() {
      popViewController(animated: true)
    }
}

extension YSHYWBNavController{
    func setupUI() {
      navigationBar.isHidden = true
    }


}

