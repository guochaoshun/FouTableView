//
//  HomeTopView.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class HomeTopView: SuperView {


    @IBOutlet weak var upView: UIView!
    
    @IBOutlet weak var midView: UIView!
    
    @IBOutlet weak var downImage: UIImageView!
    
    static let ViewHeight : CGFloat = 606.0
    
    var adArray = [HomeADModel]()

    var newUserArray = [HomeADModel]()
    
    var liveModel = HomeADModel()

    var callBackWith :  (String,AnyObject) -> Void  = {
        (keyStr,data) in
        print(keyStr,data)
    }
    
    @IBOutlet weak var button: UIButton!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadBannarDataFromNet()
        loadMidDataFromNet()
        loadDownDataFromNet()
        
        
        button.addBlockAction(for: .touchUpInside) {
            [weak self] in
            guard let weakSelf = self else {
                return
            }
            print(weakSelf)
        }
        
    }
    
    
    // 懒加载中放心使用self,不会有循环引用
    // 首页推荐
    lazy var adView : ADCollectionView! = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: upView.width * 0.6, height: upView.height)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        flowLayout.footerReferenceSize = CGSize(width: upView.width * 0.4, height: midView.height)

        let adView = ADCollectionView.init(frame: self.upView.bounds, collectionViewLayout: flowLayout)
        self.upView.addSubview(adView)
        return adView
    }()
    // 新用户特惠
    lazy var newUserView : ADCollectionView! = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: midView.width * 0.6, height: midView.height)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        let adView = ADCollectionView.init(frame: self.midView.bounds, collectionViewLayout: flowLayout)
        self.midView.addSubview(adView)
        return adView
    }()
    
    
    deinit {
        print("\(self.className)  deinit")
    }

}

// MARK: - 数据请求
extension HomeTopView {
    
    
    func loadBannarDataFromNet()  {
        
        let netWork = NetWork.init()
        netWork.url = "/client/activity/banner"
        // 网络请求 中直接使用self,也是不会有循环引用的
        netWork.responseData = {
            (data) in
            self.adArray.removeAll()
            let array = data.resultInfo as!  [ [String : AnyObject] ]
            for item in array {
                
                let model = HomeADModel.init(item)
                self.adArray.append(model)
                
            }
            print(self.adArray)
            self.adView.dataArray = self.adArray
        }
        netWork.startRequest()
        
    }
    
    func loadMidDataFromNet()  {
        
        let netWork = NetWork.init()
        netWork.url = "/client/activity/newUser"
        netWork.responseData = {
            [weak self] (data) in
            
            guard let weakSelf = self else {
                return
            }
            weakSelf.newUserArray.removeAll()
            let array = data.resultInfo as!  [ [String : AnyObject] ]
            for item in array {
                
                let model = HomeADModel.init(midDic: item)
                weakSelf.newUserArray.append(model)
            }
            
            weakSelf.newUserView.dataArray = weakSelf.newUserArray
            
            
        }
        netWork.startRequest()
        
    }
    func loadDownDataFromNet()  {
        
        let netWork = NetWork.init()
        netWork.url = "/client/activity/live"
        netWork.responseData = {
            [weak self] (data) in
            guard let weakSelf = self else {
                return
            }
            
            let array = data.resultInfo as!  [ [String:AnyObject] ]
            weakSelf.liveModel.setValuesForKeys(array.first!)
            weakSelf.downImage.kf_setWebImageWith(urlStr: weakSelf.liveModel.coverUrl )
            
            
        }
        netWork.startRequest()
        
    }
    
    
    
}















