//
//  Common.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/21星期四.
//  Copyright © 2018年 乐乐. All rights reserved.
//

// 定义全局的常量

//let Host = "http://yongchengyimei.com/api"
let Host = "http://tyc.test.internet.zhiwangyilian.com/api"

let Screen_Width = UIScreen.main.bounds.size.width
let Screen_Height = UIScreen.main.bounds.size.height

let keyString = "keyString"
let keyData = "keyData"
let tabBarHeight : CGFloat = 49

var isIphoneX : Bool {
    return Screen_Height == 812.0
}

var topHeight : CGFloat {
    if isIphoneX {
        return 44+44
    }
    return 20+44
}
var bottomHeight : CGFloat {
    if isIphoneX {
        return 33
    }
    return 0
}





