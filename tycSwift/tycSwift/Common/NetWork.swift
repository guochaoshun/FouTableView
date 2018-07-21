//
//  NetWork.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/1星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit
import Alamofire


struct ErrorMessage : Error {
    
    var errorCode = 0
    var message = ""
}



class NetWork: NSObject {
    
    
    var url = ""
    var params = [String : String]()
    var method : HTTPMethod = .post
    
    var responseData :  ([String : AnyObject]) -> Void  = {
        (data) in
        print(data)
    }
    var failReason :  (Error) -> Void  = {
        (error) in
        print(error)
    }
    
    
    func startRequest()  {
    
        var finialUrl = ""
        if url.lowercased().contains("http") {
            finialUrl = url
        } else {
            finialUrl = Host + url
        }
        
        params["userId"] = "3627284418573977666"
        params["userToken"] = "335415593487909658"
        
        
//        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
//        response.removesKeysWithNullValues = YES;
        
//        let jsonSerialization = JSONSerialization.init()
        
        
//        Alamofire.JSONSerialization = jsonSerialization
        Alamofire.request( finialUrl, method : method , parameters: params).responseJSON { (data ) in
            
            if data.result.isSuccess {
                let dic = data.result.value as! [String:AnyObject]
                
                print("~~~~~~~~" + finialUrl + "~~~~~~~~")
                print(self.params.description)
                print("~~~~~~~~服务器返回~~~~~~~~")
                print(dic.description)
                print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                
                
                guard let status = dic["resultCode"] as? Int  else {
                    
                    
                    return
                }
                if status == 200 {
                    self.responseData(dic)
                } else {
                   let error = ErrorMessage.init(errorCode: status, message: dic["message"] as! String)
                    self.failReason(error)

                    
                }
              
                
                
            } else {
                
                self.failReason(data.result.error!)

            }
            
          
        }
        
       
        
    }

}
