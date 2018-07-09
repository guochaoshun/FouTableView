//
//  ADCollectionView.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/6星期三.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class ADCollectionView : UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var dataArray : [HomeADModel]! {
        didSet {
            self.reloadData()
            
            
            let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in

                var point = CGPoint.init(x: self.contentOffset.x+self.cellWidth, y: 0)

                if point.x + 10.0 >= self.cellWidth*CGFloat(self.dataArray.count ) {
                    point = CGPoint.init(x: 0, y: 0)
                }

                self.setContentOffset(point , animated: true)

            }
            timer.fire()
        }
    }
    
    let cellWidth = 10.0+(Screen_Width-15)*0.6


    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false

        self.decelerationRate = 0

        
        self.backgroundColor = UIColor.white
        self.delegate = self
        self.dataSource = self
        self.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 代理方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        let model = self.dataArray[indexPath.row]
        cell.imageView.kf_setWebImageWith(urlStr: model.coverUrl)
        return cell
    }
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        if decelerate == false {
            scrollViewFinishScrolling()
        }

    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewFinishScrolling()
    }
    
    override func supplementaryView(forElementKind elementKind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        
        return UICollectionReusableView.init(frame: CGRect.init(x: 0, y: 0, width: cellWidth*0.5, height: self.height))
        
    }

    
    
    func scrollViewFinishScrolling()  {
        
        let currentX = self.contentOffset.x
        var targetItem = 0
        targetItem = Int( currentX / cellWidth )
        
        if ( currentX.truncatingRemainder(dividingBy: cellWidth) > cellWidth/2) {
            // 超过了一半,如果是最后,还回到原位置 , 不是最后一个 , 到下一个位置
            if (targetItem == dataArray.count) {
                
            } else {
                targetItem += 1
            }
            
        }
        print(targetItem)

        let point = CGPoint.init(x: CGFloat(targetItem) * cellWidth , y: 0)
        self.setContentOffset(point, animated: targetItem != dataArray.count)
        
    }
    
    
    
    
    

}




