//
//  NetworkTools.swift
//  TableviewCellDemo
//
//  Created by 仝兴伟 on 2017/8/7.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import AFNetworking
// 定义枚举类型
enum HTTPRequestType : Int{
    case GET = 0
    case POST
}

class NetworkTools: AFHTTPSessionManager {
    // 设计单例 let是线程安全的
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
    
}

// 封装请求方法 
extension NetworkTools {
    func request(methodType : HTTPRequestType, urlString : String, parameters : [String : AnyObject], finished :@escaping (_ result : AnyObject?, _ error : Error?)-> ())  {
        // 1 成功回调
        let successCallBack = {(task :URLSessionDataTask, result : Any) in
        finished(result as AnyObject?, nil)
        }
        // 2 失败回调
        let failureCallBack = {(task : URLSessionDataTask?, error :Error) in
            finished(nil, error)
        }
        
        if methodType == .GET {
            // get请求
            
        get(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }else {
            // post请求
            
            post(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            
      }
    }
}

//MARK --请求list数据
extension NetworkTools {
    func loadStatus(finish : @escaping (_ result : [[String : AnyObject]]?, _ error : Error?) -> ()){
        let urlString = "http://api.m.jiemian.com/article/cate/117.json?page=1"
        request(methodType: .GET, urlString: urlString, parameters: ["":"" as AnyObject]) { (result : AnyObject?, error : Error?) in
            
            // 获取字典数据
            guard let resultDict = result as? [String : AnyObject] else{
                finish(nil, error)
                return
            }
            
            guard let dic = resultDict["result"] as? [String : AnyObject] else {
                return
            }
            
            // finish
            finish(dic["rst"] as? [[String : AnyObject]], error)
        }
        
    }
}



/*
 
 // get 请求
 //        get(urlString, parameters: parameters, progress: nil, success: { (task :URLSessionDataTask, result : Any) in
 //            finished(result as AnyObject?, nil)
 //            print("请求成功")
 //        }) { (task : URLSessionDataTask?, error :Error) in
 //            print("请求失败")
 //            finished(nil, error)
 //        }
 
 // post请求
 //            post(urlString, parameters: parameters, progress: nil, success: { ( task : URLSessionDataTask, result : Any) in
 //                finished(result as AnyObject?, nil)
 //            }) { (task : URLSessionDataTask?,error : Error) in
 //                finished(nil, error)
 //            }
 //        }

 

 */



