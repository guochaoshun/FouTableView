//
//  ViewController.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/1星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: SuperViewController , UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSourse = [AModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

    }
 
    func loadData() {
        
        Alamofire.request("http://www.ipip5.com/today/api.php", method: .get, parameters: ["type":"json"]).responseJSON { (data) in
            
            guard let data = data.value as? [String : Any] else {
                return
            }
            
            let array = data["result"] as! [ [String:AnyObject] ]
            for dic in array {
                
                let model = AModel.init(dic)
                
                self.dataSourse.append(model)
            }
            print(self.dataSourse)
            
            self.tableView.reloadData()
        }
        
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

