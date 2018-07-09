//
//  HomeADModel.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class HomeADModel: RootModel {
    
    // 图片地址
    var coverUrl = ""
    // 资源类型
    var resourceType = ""
    // 跳转链接
    var resorceUrl = ""
    
    convenience init(midDic:[String:AnyObject]) {
        self.init()
        
        if let urlArray =  midDic["resourceCoverUrl"]  {
            
            let urlArray =  urlArray as! [ [String:String] ]
            self.coverUrl = urlArray[0]["imageUrl"]!
            
        }
        self.resourceType = midDic["resourceType"] as? String ?? ""
        self.resorceUrl = midDic["resorceUrl"] as? String ?? ""
        
    }
    
    
}
