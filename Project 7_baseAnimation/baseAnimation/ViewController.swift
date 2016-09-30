//
//  ViewController.swift
//  baseAnimation
//
//  Created by yumin on 2016/9/28.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fullRotation = CGFloat(M_PI * 2)
    
    let squareA = UIView()
    let squareB = UIView()
    let squareC = UIView()
    let squareD = UIView()
    let square1 = UIView()
    let square2 = UIView()
    
    func createsquare(){
        ///other square
        self.squareA.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.squareB.frame = CGRect(x: 180, y: 225, width: 80, height: 80)
        self.squareC.frame = CGRect(x: 100, y: 305, width: 80, height: 80)
        self.squareD.frame = CGRect(x: 180, y: 305, width: 80, height: 80)
        
        self.squareA.backgroundColor = UIColor.red
        self.squareB.backgroundColor = UIColor.yellow
        self.squareC.backgroundColor = UIColor.green
        self.squareD.backgroundColor = UIColor.blue
        self.square1.backgroundColor = UIColor.clear
        self.square2.backgroundColor = UIColor.clear
        
        
        
        self.view.addSubview(squareA)
        self.view.addSubview(squareB)
        self.view.addSubview(squareC)
        self.view.addSubview(squareD)
        self.view.addSubview(square1)
        self.view.addSubview(square2)
    }
    
    
    
    func topAndBottom(){
        UIView.transition(with: squareA, duration: 1.0, options: .transitionFlipFromBottom, animations: {
            self.square1.backgroundColor = self.squareA.backgroundColor
            self.squareA.backgroundColor = self.squareC.backgroundColor
            
            }, completion: nil)
        
        UIView.transition(with: squareB, duration: 1.0, options: .transitionFlipFromBottom, animations: {
            self.square2.backgroundColor = self.squareB.backgroundColor
            self.squareB.backgroundColor = self.squareD.backgroundColor        }, completion: nil)
        
        
        UIView.transition(with: squareC, duration: 1.0, options: .transitionFlipFromTop, animations: {
            self.squareC.backgroundColor = self.square1.backgroundColor
            }, completion: nil)
        
        
        UIView.transition(with: squareD, duration: 1.0, options: .transitionFlipFromTop, animations: {
            self.squareD.backgroundColor = self.square2.backgroundColor
            }, completion: nil)
    }
    
    
    func rightAndleft() {
        UIView.transition(with: squareA, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.square1.backgroundColor = self.squareA.backgroundColor
            self.squareA.backgroundColor = self.squareB.backgroundColor
            
            }, completion: nil)
        
        UIView.transition(with: squareB, duration: 1.0, options: .transitionFlipFromRight, animations: {
            self.squareB.backgroundColor = self.square1.backgroundColor        }, completion: nil)
        
        
        UIView.transition(with: squareC, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.square2.backgroundColor = self.squareC.backgroundColor
            self.squareC.backgroundColor = self.squareD.backgroundColor
            }, completion: nil)
        
        
        UIView.transition(with: squareD, duration: 1.0, options: .transitionFlipFromRight, animations: {
            self.squareD.backgroundColor = self.square2.backgroundColor
            }, completion: nil)
    }
    
    
    func Rotation(){
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.calculationModeLinear
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.squareD.transform = CGAffineTransform(rotationAngle: 1/3 * self.fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                self.squareD.transform = CGAffineTransform(rotationAngle: 2/3 * self.fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                self.squareD.transform = CGAffineTransform(rotationAngle: 3/3 * self.fullRotation)
            })
            }, completion: {finished in
                // any code entered here will be applied
                // once the animation has completed
        })
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createsquare()
        self.squareB.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
        self.squareC.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: {
            self.squareA.transform = CGAffineTransform.init(translationX: 100, y: 225)
            self.squareB.transform = CGAffineTransform.identity
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [], animations: {
                self.squareC.transform = CGAffineTransform.identity
            }, completion: nil)
        
        Rotation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func top(_ sender: AnyObject) {
        topAndBottom()
    }
    
    @IBAction func bottom(_ sender: AnyObject) {
        rightAndleft()
    }
}
