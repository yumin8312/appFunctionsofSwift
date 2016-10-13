//
//  ViewController.swift
//  ImageScroll
//
//  Created by yumin on 2016/10/13.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var image:UIImageView!
    @IBOutlet var  scrollview:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 是否顯示 水平/垂直 的滑動條
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //啟動縮放功能to Image ,若不使用此method或是回傳nil,再怎麼滑動都是無動於衷
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    }

