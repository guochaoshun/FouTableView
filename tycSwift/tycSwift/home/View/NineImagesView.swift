//
//  NineImagesView.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/12星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class NineImagesView: UIView {

    @IBOutlet var nineImageArray: [UIImageView]!
    
    @IBOutlet weak var oneBigImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var leftSmall: UIImageView!
    
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightSmall: UIImageView!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    var diaryType = ""

    
    var imageArray = [String]() {
        
        didSet {
            
           let num = CGFloat(imageArray.count)
            
            // 先把所有图片隐藏掉
            for image in nineImageArray {
                image.isHidden = true
            }
            oneBigImage.isHidden = true
            leftImage.isHidden = true
            leftSmall.isHidden = true
            rightImage.isHidden = true
            rightSmall.isHidden = true

            
            // 计算高度
            switch num {
                
            case 1,4,5,6 :
                viewHeight.constant = 20.0 + 2 * (Screen_Width - 90.0)/3.0 * 11/15
                
            case 2, 3:
                viewHeight.constant = 10 + (Screen_Width-90.0)/num*11/15
                
            case 7,8,9 :
                viewHeight.constant = 35.0 + 3 * (Screen_Width - 90.0)/3.0 * 11/15
                
            default:
                viewHeight.constant = 0.0
                
            }
            self.height = viewHeight.constant
            
            guard num>0 else {
                return
            }
            // 显示图片
            switch num {
            case 1:
                oneBigImage.isHidden = false
                oneBigImage.kf_setWebImageWith(urlStr: imageArray.first!)
                
            case 2:
                leftImage.isHidden = false
                leftImage.kf_setWebImageWith(urlStr: imageArray.first!)
                rightImage.isHidden = false
                rightImage.kf_setWebImageWith(urlStr: imageArray.last!)
                
                if diaryType == "" {
                    
                }
                
                
            case 4:
                nineImageArray[0].isHidden = false
                nineImageArray[1].isHidden = false
                nineImageArray[3].isHidden = false
                nineImageArray[4].isHidden = false

                nineImageArray[0].kf_setWebImageWith(urlStr: imageArray[0])
                nineImageArray[1].kf_setWebImageWith(urlStr: imageArray[1])
                nineImageArray[3].kf_setWebImageWith(urlStr: imageArray[2])
                nineImageArray[4].kf_setWebImageWith(urlStr: imageArray[3])
            case 3,5,6,7,8,9 :
                
                for (i,urlStr) in imageArray.enumerated() {
                    
                    nineImageArray[i].isHidden = false
                    nineImageArray[i].kf_setWebImageWith(urlStr: urlStr)
                    
                }
                
            default:
                print("图片数量不合法\(num)")
            }
            
            
            
        }
        
    }


    
    override func awakeFromNib() {
        
        print(self.className)
        
    }
    
    
    
    
    
    
    
}
