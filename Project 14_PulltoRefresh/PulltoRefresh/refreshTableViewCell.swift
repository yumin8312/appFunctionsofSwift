//
//  refreshTableViewCell.swift
//  PulltoRefresh
//
//  Created by yumin on 2016/10/12.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class refreshTableViewCell: UITableViewCell {

    @IBOutlet var dataLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
