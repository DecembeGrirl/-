//
//  YSHYWBBaseViewController.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/7/29.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit
// swift中利用extension可以把函数方法按照功能分类管理便于阅读和维护
// 注意:
// 1.extension中不能有属性
// 2.extension中不能重写父类本类的方法
// 父类控制器
class YSHYWBBaseViewController: UIViewController{
    // 如果用户没有登录就不创建TableView
    var tableView:UITableView?
    var refreshControl: UIRefreshControl?
    // 上拉刷新标记
    var isPullUp = false
    
    var isLogon = false
    
   public var visitorInfo: [String
    : String]?
    
    lazy var navBar = UINavigationBar.init(frame: YSHY_CGR_Make(0,0,CONTEXTWIDTH,64))
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadDate()
    }
    /// 重写 title 的 didSet  导航栏的title
    override var title: String?{
        didSet{
        navItem.title = title
        }
    }
    // 数据加载方法
    func loadDate() {
        // 如果子类不实现任何方法,默认关闭刷新
        refreshControl?.endRefreshing()
    }
    
    @objc func register(){
    
    }
    
    @objc func lognin(){
        
    }
    
}
// 设置界面
extension YSHYWBBaseViewController {
    func setupUI()  {
        view.backgroundColor = UIColor.randomColor
        view.addSubview(navBar)
        // 取消自动缩进 如果隐藏了导航栏会缩进20个点
        automaticallyAdjustsScrollViewInsets = false
        setNavgationBar()
        isLogon ? setupTableView():setupVisitorView()
    }
    
    func  setNavgationBar()  {
        navBar.items = [navItem]
        //系统默认的导航栏 navigationBar 有个很高的透明度  使用下面的设置来降低透明度
        navBar.barTintColor = YSHY_Color_RGBValue(0xF6F6F6)
        // 修改导航栏的title的颜色
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
    
    func setupTableView()  {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navBar)
        // 设置数据源和代理  目的让子类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
        // 设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navBar.bounds.height, left:0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
    
        // 设置刷新空间
        refreshControl = UIRefreshControl.init()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadDate), for: .valueChanged)
    }
    //设置访客视图
    func setupVisitorView()  {
        let visitoreView:YSHYWBVisitorView = YSHYWBVisitorView.init(frame: view.bounds)
        view.insertSubview(visitoreView, belowSubview:navBar)
        visitoreView.visitorDicInfo = visitorInfo

        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", target: self, action: #selector(register))
        
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", target: self, action: #selector(lognin))
        
        
    }
}
// 父类准备方法,子类负责具体实现
// 子类的数据源方法不需要super
extension YSHYWBBaseViewController: UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // 在显示最后一行的时候做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 1. 判断 indexpath 是否是最后一行
        // section (最大的分组)  row(最后一行)
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if( row < 0 || section < 0)
        {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        if(row == (count - 1) && !isPullUp)
        {
            print("上拉刷新")
            isPullUp = true
            // 开始刷新
            loadDate()
        }
    }
}
