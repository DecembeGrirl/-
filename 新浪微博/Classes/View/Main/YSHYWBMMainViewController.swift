//
//  YSHYWBMMainViewController.swift
//  微博
//
//  Created by 杨淑园 on 2017/7/30.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit

class YSHYWBMMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupChildController()
        setComposeBtn()
    }
    
    // 设置竖屏
    // 设置支持的方向后,当前控制器以及其子控制器都会遵守这个方向
    // 如果播放视频,通常使用modal展现
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    
    func compsStatus() {
        print("点击了的中间的按钮啊")
        // 测试方向旋转
        let VC = UIViewController()
        VC.view.backgroundColor = UIColor.randomColor
        let  nav = UINavigationController.init(rootViewController: VC)
        present(nav, animated: true, completion: nil)
    }
    
     lazy var composBtn:UIButton = { () -> UIButton in
        let composBtn = UIButton.init(type: UIButtonType.custom)
        composBtn.setImage(UIImage.init(named: "tabbar_discover"), for: .normal)
        composBtn.addTarget(self, action: #selector(compsStatus), for: .touchUpInside)
        return composBtn
    }()
}


//extension  类似于OC中的分类 在swift中可以用来切分代码块
// 可以把功能相近的函数放在一个extension 中
//便于维护
// 注意: 和OC一样不能定义属性
extension YSHYWBMMainViewController{
    
    func setupUI() {
        //设置选中状态的的字体颜色, 如果没有设置选中图片, 那么图片的线条将变为设置的颜色
        tabBar.tintColor = UIColor.orange
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12.0)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)], for: .selected)
    }
    
    func setComposeBtn() {
        tabBar.addSubview(composBtn)
        let count = CGFloat((viewControllers?.count)!)
        let w = tabBar.bounds.width / count
        // 使用缩进来 设置 中间的button 的 大小
        composBtn.frame = tabBar.bounds.insetBy(dx:2 * w, dy: 0)
    }
    
    func setupChildController() {
        //从bundle 中的main.json中取出 界面的数据
        guard let path = Bundle.main.path(forResource: "main.json", ofType: nil),
           let data = NSData.init(contentsOfFile: path),
        let array = try?JSONSerialization.jsonObject(with: data as Data, options: []) as! [[String:Any]] else{return}
        
        var arrayM = [UIViewController]()
        for dic in array {
            arrayM.append(controller(dict: dic as [String : AnyObject] ))
        }
        viewControllers = arrayM
    }
    
    private func controller(dict: [String: AnyObject]) -> UIViewController{
        // 1.获取字典内容
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imgName = dict["imgName"] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace+"."+clsName) as? YSHYWBBaseViewController.Type,
            let visitorInfo = dict["visitorInfo"] as? [String : String]
        
            else { return UIViewController() }
        
        let  vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imgName)
        vc.visitorInfo = visitorInfo
        // 设置选中状态下图片
//        vc.tabBarItem.selectedImage = UIImage.init(named: imgName+"_selected")?.withRenderingMode(.alwaysOriginal)
        let nav = YSHYWBNavController.init(rootViewController: vc)
        
        return nav
    }
}

