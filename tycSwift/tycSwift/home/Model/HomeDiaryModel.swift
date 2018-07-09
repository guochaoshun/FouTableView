//
//  NewUserCheapModel.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

//enum DiaryType : String {
//    case 医师志 : "2221"
//    
//    
//    
//}

// 202002 用户普通日记 204003 医生志
class DiaryDetail: RootModel {
    var diaryFileUrl = [String]() // 放的图片链接地址
    var diaryId = "" //日记ID
    var distanceTime = "2018-04-27" // 创建时间
    var diaryInfo = "" // 日记的内容
}



class HomeDiaryModel: RootModel {

//    202001 用户日记对比照
//    202002 用户普通日记
//    204001 正在直播
//    204002 直播回看
//    204003 医生志
    var diaryType = ""
    
    // 医生志,用户普通日记的数据来源
    var diaryDetail = DiaryDetail()

    var followYn = "" // 是否已关注 , 0 未关注 ; 1 已关注
    
    var commentNum = 0 //评论数
    
    var diaryFabulous = "" // 点赞数
    
    var isThumbUp = "" // 是否已点赞 , 0 未点赞 ; 1 已点赞
    
    var authorName = ""
    
    var authorImgUrl = ""
    
    var authorID = ""
    
    var authorType : String {
        get {
            if self.diaryType.hasPrefix("202") {
                return "200002"
            } else if self.diaryType.hasPrefix("204") {
                return "200001"
            }
            return ""
        }
    }
    
    
    init( data : [String : AnyObject]) {
        super.init()


        setValuesForKeys(data)

        guard let userInfo = data["userInfo"] as? [String:Any] else {
            return
        }
        self.authorName = userInfo["userName"] as? String ?? ""
        self.authorID = userInfo["userId"] as? String ?? ""
        self.authorImgUrl = userInfo["userImgUrl"] as? String ?? ""


        switch self.diaryType {
            
        case "202001" :
            setBeforeAfter(dic: data["diary"] as! [String : AnyObject])
        case "202002":
            setUserDiary(dic: data["diary"] as! [String : AnyObject])
            
        case "204003":
            setDoctorNote(dic: data["doctorNote"] as! [String : AnyObject])

        default:
            return
        }
    }
    
    func setBeforeAfter(dic : [String:AnyObject]) {
        diaryDetail.diaryId = dic["diaryId"] as! String
        diaryDetail.distanceTime = dic["distanceTime"] as! String
        diaryDetail.diaryInfo = dic["diaryInfo"] as! String
        
        diaryDetail.diaryFileUrl.append(dic["diaryBeforeImg"] as! String )
        let doctorFileUrl = dic["diaryAfterImg"] as! String
        diaryDetail.diaryFileUrl.append(doctorFileUrl.components(separatedBy: ";").first!)
        
    }
  
    
    func setUserDiary(dic : [String:AnyObject]) {
        diaryDetail.diaryId = dic["diaryId"] as! String
        diaryDetail.distanceTime = dic["distanceTime"] as! String
        diaryDetail.diaryInfo = dic["diaryInfo"] as! String
        let doctorFileUrl = dic["diaryFileUrl"] as! String
        diaryDetail.diaryFileUrl = doctorFileUrl.components(separatedBy: ";")
    }
    
    func setDoctorNote(dic : [String:AnyObject]) {
        
        diaryDetail.diaryId = dic["doctorNoteId"] as! String
        diaryDetail.distanceTime = dic["distanceTime"] as! String
        diaryDetail.diaryInfo = dic["doctorNoteInfo"] as! String
        let doctorFileUrl = dic["doctorFileUrl"] as! String
        diaryDetail.diaryFileUrl = doctorFileUrl.components(separatedBy: ";")
        
    }
}
