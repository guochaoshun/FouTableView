//
//  NetWork.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/1星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

struct ErrorMessage : Error {
    
    var errorCode = 0
    var message = ""
}


//let Host = "http://yongchengyimei.com/api"
let Host = "http://tyc.dev.internet.zhiwangyilian.com/api"

class NetWork: NSObject {
    
    
    var url = ""
    var params = [String : String]()
    var responseData :  ([String : AnyObject]) -> Void  = {
        (data) in
        print(data)
    }
    var failReason :  (Error) -> Void  = {
        (error) in
        print(error)
    }
    
    
    func startRequest()  {

       
        
    }

}
