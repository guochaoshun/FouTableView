//
//  ViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/1星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class ViewController: SuperViewController , UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSourse = [AModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

    }
 
    func loadData() {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourse.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = dataSourse[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACell") as! ACell
        
        cell.yearLabel.text = model.year
        cell.descLabel.text = model.title
        
        return cell
    }
    
    
    
    
    
    
    
}

