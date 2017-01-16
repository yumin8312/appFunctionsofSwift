//
//  swipeCellTableViewCell.swift
//  swipeableCell
//
//  Created by yumin on 2016/9/17.
//  Copyright © 2016年 yumin8312. All rights reserved.
//

import UIKit

class swipeCellTableViewCell: UITableViewCell {
    
    @IBOutlet var imagedView:UIImageView!
    @IBOutlet var nameLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
