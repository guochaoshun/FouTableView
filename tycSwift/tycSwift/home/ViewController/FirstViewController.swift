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

        for _ in 0 ..< 30 {
            let model = HomeDiaryModel.init(data: ["a":"1"] as [String: AnyObject])
            self.dataArray.append(model)
        }
        self.tableView.reloadData()
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
        
        
    }
    
    
    
}





