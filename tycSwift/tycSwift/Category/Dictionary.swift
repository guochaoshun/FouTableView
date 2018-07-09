//
//  Dictionary.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/1星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

extension Dictionary {

    var description: String {

        // 用swift的字典打印,格式上有点问题,不会竖排对齐,NSDictionary就很好,OC的文件也要留着,不然会变成UNicode编码
        let dic : NSDictionary = self as NSDictionary
        return dic.description

    }
    
    var debugDescription : String {
        return self.description
    }
    
    
    var resultInfo : AnyObject!  {
        
        guard let dic = self as? [String:AnyObject] else {
            print(" 不是这种类型 [String:AnyObject] , 类型转换有问题  ")
            return nil
        }
        
        return dic["resultInfo"]
    }

    
    
}


extension UIColor {
    class func hexNum(_ hexNum : Int) -> UIColor {
        
        let red : CGFloat = CGFloat((hexNum & 0xFF0000)>>16)
        let green : CGFloat = CGFloat((hexNum & 0x00FF00)>>8)
        let blue : CGFloat = CGFloat(hexNum & 0x0000FF)
        let color = UIColor.init(red: red / 255.0 , green: green / 255.0 , blue: blue / 255.0, alpha: 1)
        return color
        
    }
}

extension UIView {
    
    /// x坐标
    var x : CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin.x
        }
    }
    /// y坐标
    var y : CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin.y
        }
    }
    
    /// 最右边的x
    var maxX : CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
        get {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    /// 最右边的y
    var maxY : CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    /// 原点坐标
    var origin : CGPoint {
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin
        }
    }
    /// 中心点x坐标
    var centerX : CGFloat {
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
        get {
            return self.center.x
        }
    }
    /// 中心点Y坐标
    var centerY : CGFloat {
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
        get {
            return self.center.y
        }
    }
    
    /// 宽
    var width : CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.width
        }
    }
    /// 高
    var height : CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.height
        }
    }
    
    var size : CGSize {
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        get {
            return self.frame.size
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    var captureImageFromSelf : UIImage {
        
        UIGraphicsBeginImageContext(self.bounds.size)
        let ctx = UIGraphicsGetCurrentContext()
        self.layer.render(in: ctx!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    
    
}

extension UITabBar {
    
    @IBInspectable var isRenderingMode : Bool {
        set {

            guard let items = self.items else {
                return
            }

            for item in items {
                item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.hexNum(0xce0f32)], for: .selected)
            }

        }
        get {
            return true
        }
    }
    
}


