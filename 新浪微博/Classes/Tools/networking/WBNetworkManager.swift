//
//  WBNetworkManager.swift
//  新浪微博
//
//  Created by 杨淑园 on 2017/9/4.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit
import Alamofire

enum WBHTTPMethod:String {
    case GET
    case POST
}

class WBNetworkManager: NSObject {
    //定义返回闭包
    var successBlock = {(result:NSDictionary) ->() in
    }
    var failureBlock = {(result:NSDictionary) ->() in
    }
    let headers = ["Content-Type" : "application/json"]
    func WBRequst(url:String,method:WBHTTPMethod = .GET,parameters:[String:Any]) {
            if(method == .GET)
            {
                Alamofire.request(url, method: .get, parameters:parameters, encoding:JSONEncoding.default, headers: headers).responseJSON{ response in
                    
                    print(response);
                }
            
            }
            else
            {
                let result = Alamofire.request(url, method: .post, parameters:parameters, encoding:JSONEncoding.default, headers: headers)
                    .responseJSON{ response in
                        print(response);
                }
                print(result)
        }

    }
}
