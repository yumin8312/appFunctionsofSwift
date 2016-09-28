//
//  DetailTableViewCell.swift
//  navigationController
//
//  Created by yumin on 2016/9/27.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailnameLabel: UILabel!
    
    @IBOutlet weak var detailvalueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
