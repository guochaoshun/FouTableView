//
//  HotInfoCell.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/12星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class HotInfoCell: UITableViewCell {

    
    @IBOutlet weak var authorImage: UIImageView!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var focusButton: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var imageViews: UIView!
    @IBOutlet weak var imageViewsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var praiseButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    var nineImages : NineImagesView!
    
    
    var model : HomeDiaryModel!{
        
        didSet{
            authorImage.kf_setWebImageWith(urlStr: model.authorImgUrl)
            authorName.text = model.authorName
            time.text = model.diaryDetail.distanceTime
            focusButton.isSelected = model.followYn == "1"
            infoLabel.text = model.diaryDetail.diaryInfo
            
            nineImages.diaryType = model.diaryType
            nineImages.imageArray = model.diaryDetail.diaryFileUrl
            
            imageViewsHeight.constant = nineImages.viewHeight.constant
            
            praiseButton.setTitle(" 赞 \(model.diaryFabulous)", for: .normal)
            praiseButton.isSelected = model.isThumbUp == "1"
            
            commentButton.setTitle(" 评论 \(model.commentNum)", for: .normal)
            
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nineImages = Bundle.main.loadNibNamed("NineImagesView", owner: nil, options: nil)?.first as! NineImagesView
        nineImages.width = imageViews.width
        imageViews.addSubview(nineImages)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
