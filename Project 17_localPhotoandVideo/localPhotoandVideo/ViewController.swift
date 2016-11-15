//
//  ViewController.swift
//  localPhotoandVideo
//
//  Created by yumin on 19/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var photoview: UIImageView!
    @IBOutlet weak var webview: UIWebView!
    
    var backgroundPlayer : BackgroundVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing your instance
        backgroundPlayer = BackgroundVideo(on: self, withVideoURL:"test.mp4") // Passing self and video name with extension
        backgroundPlayer?.setUpBackground()
        
        
        //video view
        let fileURL = NSURL(fileURLWithPath: "/Users/min/Documents/GitHub/appFunctionsofSwift/Project 17_localPhotoandVideo/localPhotoandVideo/Wildlife.mp4")
        
        webview.loadHTMLString("<iframe width = \" \(self.webview.frame.width) \" height =  \" \(self.webview.frame.height)\" src= \"\(fileURL)\"> </iframe>" , baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addphoto(_ sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.delegate = self
        self.present(image, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let theinfo:NSDictionary = info as NSDictionary
        let image:UIImage = theinfo.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
        photoview.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
}

