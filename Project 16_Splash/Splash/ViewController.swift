//
//  ViewController.swift
//  Splash
//
//  Created by yumin on 2016/10/15.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var splashimage = UIImageView()
    
    @IBOutlet var launchimage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        launchSplash()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [], animations: {
            self.splashimage.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            }, completion: nil)
        
        //let image Gradually transparent
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0   //初始時間
        animation.toValue = 0.0     //結束時間
        animation.duration = 2.0    //間隔
        self.splashimage.layer.add(animation, forKey: "Image-opacity")
        self.splashimage.alpha = 0
        self.view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func launchSplash(){
        splashimage.frame = CGRect(x: 85.0, y: 238.0, width: 200.0, height: 200.0)
        splashimage.image = UIImage(named: "fireworks")
        splashimage.contentMode = .scaleToFill
        splashimage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        self.view.addSubview(splashimage)
    }


}

