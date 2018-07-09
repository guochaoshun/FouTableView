//
//  BaseViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit



class BaseViewController: SuperViewController , UITableViewDataSource ,UITableViewDelegate  {
    
    var subTable : UITableView! 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}




// MARK: - tableview代理
extension BaseViewController {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SubTableScroll"), object: nil, userInfo: ["scrollView":scrollView])
        
        
    }
    
    
    
}







