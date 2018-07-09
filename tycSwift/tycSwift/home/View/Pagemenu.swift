
//
//  Pagemenu.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/7/4星期三.
//  Copyright © 2018年 智网易联. All rights reserved.
//

import UIKit

class PageMenu: SuperView {

    
    @IBOutlet var buttonArray: [UIButton]!
    
    
    
    @IBAction func tapPageMenu(_ sender: UIButton) {
        
        for button in buttonArray {
            button.isSelected = false
        }
        sender.isSelected = true
        
        self.callBack?( [keyString:"tapPageMenu",keyData:sender.tag] )
        
    }
    
    
    
    
    
    
    
    
    
}
