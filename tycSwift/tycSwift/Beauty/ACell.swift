//
//  ACell.swift
//  tycSwift
//
//  Created by 郭朝顺 on 2018/6/5星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

import UIKit

class ACell: UITableViewCell {

    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
