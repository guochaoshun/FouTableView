
//
//  HomeViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/7/4星期三.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class HomeViewController: SuperViewController {

    var sonViewController = [BaseViewController]()
    
    var startScrollX : CGFloat = 0
    
    lazy var scrollView : UIScrollView = {
        let sc = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height) )
        sc.showsVerticalScrollIndicator = false
        sc.showsHorizontalScrollIndicator = false
        sc.contentSize = CGSize.init(width: Screen_Width*4, height: 0)
        sc.isPagingEnabled = true
        sc.delegate = self
//        sc.isScrollEnabled = false
        sc.contentInsetAdjustmentBehavior = .never
        
        let first = FirstViewController()
        first.view.x = 0
        sc.addSubview(first.view)
        self.addChildViewController(first)
        
        let second = SecondViewController()
        second.view.x = Screen_Width
        sc.addSubview(second.view)
        self.addChildViewController(second)
        
        let third = ThirdViewController()
        third.view.x = Screen_Width * 2
        sc.addSubview(third.view)
        self.addChildViewController(third)
        
        let four = FourViewController()
        four.view.x = Screen_Width * 3
        sc.addSubview(four.view)
        self.addChildViewController(four)
        
        sonViewController.append(first)
        sonViewController.append(second)
        sonViewController.append(third)
        sonViewController.append(four)

        
        
        self.view.addSubview(sc)
        
        
        NotificationCenter.default.addObserver(forName:  Notification.Name(rawValue: "SubTableScroll"), object: nil, queue: OperationQueue.main, using: { (noti) in

            print("子table滚动了,改变pageMenu的高度")

            guard let subTable = noti.userInfo!["scrollView"] as? UITableView else {
                return
            }
            if  subTable.contentOffset.y >= HomeTopView.ViewHeight {
                self.pageMenu.y = topHeight
            } else {
                self.pageMenu.y = HomeTopView.ViewHeight + topHeight - subTable.contentOffset.y
            }
            
            
            
        })
        
        
        return sc
    }()
    
    lazy var headerView : HomeTopView = {
        let headerView = Bundle.main.loadNibNamed("HomeTopView", owner: nil, options: nil)?.first as! HomeTopView
        headerView.width = Screen_Width
        headerView.height = HomeTopView.ViewHeight
        // 正确写法,无循环应用
        headerView.callBackWith = {
            [weak self] (keyStr,data) in
            
            guard let weakSelf = self else {
                return
            }
            print(weakSelf)
            print(keyStr,data)
        }
        // 错误写法,导致内存无法释放
        //        headerView.callBackWith = {
        //             (keyStr,data) in
        //
        //           print(self)
        //            print(keyStr,data)
        //        }
        
        return headerView
    }()
    
    lazy var pageMenu : PageMenuView = {
        
        let page = Bundle.main.loadNibNamed("PageMenu", owner: nil, options: nil)?.first as! PageMenuView
        page.frame = CGRect(x: 0.0, y: HomeTopView.ViewHeight+topHeight, width: Screen_Width, height: 44.0)
        
        page.callBack = {
            [weak self] (dic) in
            
            guard let weakSelf = self else {
                return
            }
            
            let keyStr = dic[keyString] as! String
            if keyStr == "tapPageMenu" {
                // 点击了pageMenu,切换tableView
                let tag = ( dic[keyData] as! Int ) - 100

                weakSelf.scrollView.setContentOffset(CGPoint(x: Screen_Width * CGFloat(tag), y: 0), animated: false)

                guard let subTable = weakSelf.sonViewController[tag].subTable else {return}
                
                subTable.tableHeaderView?.addSubview(weakSelf.headerView)
                weakSelf.headerView.x = 0
                weakSelf.headerView.y = 0
                if weakSelf.pageMenu.y > topHeight {
                    
                    subTable.contentOffset = CGPoint(x: 0 , y :  topHeight + HomeTopView.ViewHeight - weakSelf.pageMenu.y)

                } else {
                    
                    subTable.contentOffset = CGPoint(x: 0 , y :  topHeight + HomeTopView.ViewHeight - weakSelf.pageMenu.y + subTable.contentOffset.y)

                    // 如果超出了底部,那就到底部就好
                    if subTable.contentOffset.y > subTable.contentSize.height-subTable.height {
                        subTable.contentOffset = CGPoint(x: 0 , y : subTable.contentSize.height - subTable.height)
                    }
                    
                }
                
                
                weakSelf.pageMenu.x = Screen_Width * CGFloat(tag)
                
            }
            
           
            
            
        }
        
        
        self.scrollView.addSubview(page)
        return page
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageMenu.tapPageMenu(self.pageMenu.buttonArray.first!)
        
        
        DispatchQueue.main.asyncAfter(timeAfterNow: 3) {
            
            self.sonViewController.first?.subTable?.tableHeaderView?.addSubview(self.headerView)

        }
        
    }

    
    
    
    
    
    
    
    
    


}

extension HomeViewController : UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        pageMenu.x = scrollView.contentOffset.x
        
        scrollView.addSubview(headerView)
        
        headerView.x = scrollView.contentOffset.x
        

        headerView.maxY = pageMenu.y

        startScrollX = scrollView.contentOffset.x
    }
    
    
 
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        pageMenu.x = scrollView.contentOffset.x
        headerView.x = scrollView.contentOffset.x
        headerView.maxY = pageMenu.y

        
        var target = Int(scrollView.contentOffset.x/scrollView.width)
        if scrollView.contentOffset.x > startScrollX {
            target = Int(scrollView.contentOffset.x/scrollView.width) + 1
            
            if target >= sonViewController.count {
                target = target - 1
            }
            
        }
        
        let subTable = self.sonViewController[target].subTable
        subTable?.contentOffset = CGPoint(x: 0 , y :  topHeight + HomeTopView.ViewHeight - self.pageMenu.y)
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if decelerate {
            return
        }
        
        finishDragAndGoingToChangeTable(scrollView: scrollView)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        finishDragAndGoingToChangeTable(scrollView: scrollView)
        
    }
    
    // scrollView.setContentOffset(CGPoint(x: Screen_Width * CGFloat(tag), y: 0), animated: true)
    // 当为true时,结束动画回到这里
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        finishDragAndGoingToChangeTable(scrollView: scrollView)
    }
    
    func finishDragAndGoingToChangeTable(scrollView: UIScrollView)  {
        
        let tag = Int(scrollView.contentOffset.x / scrollView.width)
        let subTable = self.sonViewController[tag].subTable
        subTable?.tableHeaderView?.addSubview(headerView)
        headerView.x = 0
        headerView.y = 0
        
        self.pageMenu.tapMenuChangeUI(selectedButton : self.pageMenu.buttonArray[tag])

        
    }
   
    
    
}








