//
//  Bundle+Extenstion.swift
//  YSHYTest
//
//  Created by 杨淑园 on 2017/7/22.
//  Copyright © 2017年 yangshuyaun. All rights reserved.
//

import Foundation

extension Bundle {
    
    // 返回命名空间
//    func nameSpace() -> String {
////      return  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return  infoDictionary?["CFBundleName"] as? String ?? ""
//        
//    }
    
    // 计算型属性, 有返回值,没有参数
    var nameSpace: String{
        return  infoDictionary?["CFBundleName"] as? String ?? ""
    }

}
