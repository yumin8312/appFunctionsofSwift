//
//  carouselCollectionViewCell.swift
//  CarouselEffect
//
//  Created by yumin on 24/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit

class carouselCollectionViewCell: UICollectionViewCell {
    
    var carousels:carouselData! {
        didSet {
            updataUI()
        }
    }
    
    @IBOutlet weak var carouselImage: UIImageView!
    
    @IBOutlet weak var carouselLabel: UILabel!
    
    
    func updataUI() {
        
        carouselLabel.text = carousels.titlename
        carouselImage.image = carousels.carouselimage
    }
    
}
