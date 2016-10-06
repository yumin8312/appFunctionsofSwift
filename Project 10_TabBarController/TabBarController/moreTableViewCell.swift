//
//  moreTableViewCell.swift
//  TabBarController
//
//  Created by yumin on 2016/10/6.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class moreTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var imagesview:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
