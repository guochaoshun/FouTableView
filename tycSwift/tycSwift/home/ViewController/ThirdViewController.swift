
//
//  ThirdViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/7/4星期三.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: topHeight, width: Screen_Width, height: Screen_Height-topHeight-bottomHeight), style: .grouped)
        tableView.contentInsetAdjustmentBehavior = .never

        self.subTable = tableView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: HomeTopView.ViewHeight))
        tableView.tableHeaderView = view
        tableView.tableFooterView = UIView.init()
        tableView.estimatedRowHeight = 100
        
        self.view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()

        
        
    }

}


extension ThirdViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "sss")
        cell.textLabel?.text = "3333---\(indexPath.row)"

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



