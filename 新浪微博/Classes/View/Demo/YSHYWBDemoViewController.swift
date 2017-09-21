//
//  YSHYWBDemoViewController.swift
//  微博
//
//  Created by 杨淑园 on 2017/8/2.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit

class YSHYWBDemoViewController: YSHYWBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        
       
    }

    @objc func toNext () {
        let vc = YSHYWBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func toBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension YSHYWBDemoViewController {

     override func setupUI () {
        super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", target: self, action: #selector(toNext))
//            UIBarButtonItem.init(title: "下一个", target: self, action: #selector(toNext))
    
    }
}
