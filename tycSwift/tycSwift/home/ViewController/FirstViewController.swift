//
//  FirstViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController  {

    
    var dataArray = [HomeDiaryModel]()

    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: topHeight, width: Screen_Width, height: Screen_Height-topHeight-bottomHeight), style: .grouped)
        
        tableView.contentInsetAdjustmentBehavior = .never

        self.subTable = tableView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: HomeTopView.ViewHeight))
        tableView.tableHeaderView = view
        tableView.register(UINib.init(nibName: "HotInfoCell", bundle: nil), forCellReuseIdentifier: "HotInfoCell")
        tableView.tableFooterView = UIView.init()
        tableView.estimatedRowHeight = 100
   
        self.view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromNet()
   
        
    }

   
    

}

extension FirstViewController  {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotInfoCell") as! HotInfoCell
        
        cell.model = self.dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        header.backgroundColor = UIColor.red
        return header
        
    }
    
    
    
}

extension FirstViewController {
    
    
    func loadDataFromNet() {
        
        let netWork = NetWork.init()
        netWork.url = "/client-community/client/community/hot/hotList"
        netWork.params = ["pageIndex":"0" ,"pageSize":"10"]
        
        netWork.responseData = {
            [weak self] (data) in
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.dataArray.removeAll()
            let array = data.resultInfo as!  [ [String:AnyObject] ]
            for item in array {
                let model = HomeDiaryModel.init(data : item)
                weakSelf.dataArray.append(model)
            }
            
            weakSelf.tableView.reloadData()
        }
        
        netWork.failReason = {
            (error) in
            print(error)
        }
        
        netWork.startRequest()
        
        
    }
    
    
    
}





