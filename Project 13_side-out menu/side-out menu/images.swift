//
//  images.swift
//  side-out menu
//
//  Created by yumin on 2016/10/11.
//  Copyright © 2016年 yumin. All rights reserved.
//

import Foundation

class images: UIViewController {
    
    
    @IBOutlet weak var imaged: UIImageView!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        imaged.image = UIImage(named: "ButterflyBridge")
    }
    
    
    
}
