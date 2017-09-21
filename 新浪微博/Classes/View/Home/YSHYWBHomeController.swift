//
//  YSHYWBHomeController.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/7/29.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit
// 定义全局变量 尽量使用private 来定义,避免导出都可以使用
 private let cellID = "cellID"

class YSHYWBHomeController: YSHYWBBaseViewController {
     lazy var statusList  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let networkManger = WBNetworkManager.init()
        networkManger.WBRequst(url: "https://baidu.com",method: .POST, parameters:[:])

    }
    
    override func loadDate() {
        // 模拟一个延时操作
        print("延时加载")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for i in 0..<30
            {
                if self.isPullUp
                {
                    self.statusList.append("上拉"+i.description)
                }else
                {
                    self.statusList.insert(i.description, at: 0)
                }
            }
            self.refreshControl?.endRefreshing()
            self.isPullUp = false
            self.tableView?.reloadData()
        }
        
    }
    
    @objc func selctedgoodFriends () {
        let VC = YSHYWBDemoViewController()
        navigationController?.pushViewController(VC, animated: true)
    }

}

extension YSHYWBHomeController{
     override func setupUI() {
        super.setupUI()
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action: #selector(selctedgoodFriends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
// 表格数据方法
extension YSHYWBHomeController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = statusList[indexPath.row]
        return cell!
    }
}


