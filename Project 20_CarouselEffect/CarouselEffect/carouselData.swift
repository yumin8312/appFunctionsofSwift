//
//  carouselData.swift
//  CarouselEffect
//
//  Created by yumin on 24/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit

class carouselData {

    var titlename = ""
    var carouselimage: UIImage!
    
    init(titlename : String, carouselimage: UIImage!) {
        self.titlename = titlename
        self.carouselimage = carouselimage
    }
    
    static func createData() -> [carouselData]
    {
        return
            [
                carouselData(titlename: "SunRise", carouselimage: UIImage(named: "sunrise")),
                carouselData(titlename: "SunSet", carouselimage: UIImage(named: "Sunset")!),
                carouselData(titlename: "Sketch", carouselimage: UIImage(named: "Sketch")!),
                carouselData(titlename: "Butterfly Bridge", carouselimage: UIImage(named: "ButterflyBridge")!),
                carouselData(titlename: "Valentine Bridge", carouselimage: UIImage(named: "Valentine Bridge")!),
                carouselData(titlename: "Fort Zeelandia", carouselimage: UIImage(named: "FortZeelandia")!),
                carouselData(titlename: "nightView", carouselimage: UIImage(named: "nightView")!),
                carouselData(titlename: "nightView_2", carouselimage: UIImage(named: "nightView-2")!),
                carouselData(titlename: "TreeHouse", carouselimage: UIImage(named: "treehouse")!),
                carouselData(titlename: "TreeHouse_2", carouselimage: UIImage(named: "treehouse-2")!)
            ]
    }
}
