//
//  RootModel.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

// 在Swift 4中继承 NSObject 的 swift class 不再默认全部 bridge 到 OC，如果我们想要使用的话我们就需要在class前面加上@objcMembers 这么一个关键字。
@objcMembers class RootModel: NSObject {

   
    convenience init(_ dic:[String: AnyObject]) {

        self.init()
        setValuesForKeys(dic)
        
    }
  
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        
        let dic : NSMutableDictionary = NSMutableDictionary.init()
        var count : uint = 0

        let property_list = class_copyPropertyList( self.classForCoder , &count)
        for ii in 0 ..< count {
            let i = Int(ii)
            let property_t = property_list![i]
            let name : String =  String(utf8String: property_getName(property_t))!
            let value = self.value(forKey: name) ?? "nil"
            dic.setObject(value, forKey: name as NSCopying)
        }
        free(property_list)
        return  "<\( self.classForCoder ):\( String(format: "%p", self) )> -- \(dic.description)\n"
    }
    
    
}





