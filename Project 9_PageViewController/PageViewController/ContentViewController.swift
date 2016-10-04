//
//  ViewController.swift
//  PageViewController
//
//  Created by yumin on 2016/10/4.
//  Copyright © 2016年 yumin. All rights reserved.
//


import UIKit
import CoreData
class ContentViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var contentImageview: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet var forwardButton:UIButton!
    
    var index = 0
    var head = ""
    var imagefile = ""
    var content = ""
    
    @IBAction func nextButtonTapped(sender: UIButton){
        switch index {
        case 0...1:
            let pageViewController = parent as! PageViewController
            pageViewController.forward(index: index)
        case 2:
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    // use NSUserDefaults 來儲存導引畫面是否已啟動
    
//    @IBAction func close(sender: AnyObject){
//        let defaults = UserDefaults.standaedUserDefaults()
//        defaults.setBool(true, forKey: "hasViewedWalkthough")
//        dismiss(animated: true, completion: nil)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        headLabel.text = head
        contentImageview.image = UIImage(named: imagefile)
        contentLabel.text = content
        
        //create custom page control
        pageControl.currentPage = index
        
        //create next & done button
        switch index {
        case 0...1:
            forwardButton.setTitle("NEXT", for: .normal)
        case 2:
            forwardButton.setTitle("DONE", for: UIControlState.normal)
        default:
            break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

