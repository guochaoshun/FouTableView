//
//  UIImageView.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/6星期三.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    /// 自带占位图
    func kf_setWebImageWith(urlStr:String) {
        if urlStr.lowercased().hasPrefix("http") == false {
            return
        }
        
        self.kf.setImage(with: URL.init(string: urlStr)!, placeholder: UIImage.init(named: "zhanweitu"))
        
    }
    /// 可以指定占位图
    func kf_setWebImageWith(urlStr:String , placeholder: String) {
        if urlStr.lowercased().hasPrefix("http") == false {
            return
        }
        self.kf.setImage(with: URL.init(string: urlStr)!,
                         placeholder: UIImage.init(named: placeholder) ,
                         options: nil,
                         progressBlock: nil,
                         completionHandler: nil)
        
    }

}

extension UIImage {
    
    class func imageWithColor(color:UIColor)->UIImage {
 
        let rect = CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height)
        UIGraphicsBeginImageContext(rect.size)
        let ref = UIGraphicsGetCurrentContext()
        ref?.setFillColor(color.cgColor)
        ref?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    
}



extension NSObject {
    
    var className : NSObject.Type {
        
        get{
            return  type(of: self)
        }
        
    }
    
}

extension String {
    func subString(start : Int , end : Int) -> String {
        if start > end {
            return self.subString(start: end,end: start)
        }
        if start < 0 {
            return self.subString(start: 0, end: end )
        }
        if end > self.count {
            return self.subString(start: start, end: self.count )
        }
//        self.index(str.endIndex, offsetBy: -10)
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
      
        return String(self[ startIndex ..< endIndex ])
    }
    
    
}



extension DispatchQueue {
    
    func asyncAfter(timeAfterNow : Double ,execute work: @escaping @convention(block) () -> Swift.Void)  {
        
        self.asyncAfter(deadline: DispatchTime.now() + timeAfterNow, execute: work)
        
    }
    
}

