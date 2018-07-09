
//
//  Pagemenu.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/7/4星期三.
//  Copyright © 2018年 智网易联. All rights reserved.
//

import UIKit

class PageMenuView: SuperView {

    
    @IBOutlet var buttonArray: [UIButton]!
    
    override func awakeFromNib() {
        
        for button in buttonArray {
            
            button.setBackgroundImage(UIImage.imageWithColor(color: UIColor.white), for: .normal)
            button.setBackgroundImage(UIImage.imageWithColor(color: UIColor.orange), for: .selected)
            
        }
        
    }
    
    @IBAction func tapPageMenu(_ sender: UIButton) {
        
        print(11111111)
        for button in buttonArray {
            button.isSelected = false
        }
        sender.isSelected = true
        
        self.callBack?( [keyString:"tapPageMenu",keyData:sender.tag] )
        
    }
    
    
    
    
    
    
    
    
    
}
