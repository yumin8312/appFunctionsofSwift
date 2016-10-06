//
//  PageViewController.swift
//  PageViewController
//
//  Created by yumin on 2016/10/4.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageheader = ["SunRise","SunSet","NightView"]
    var pageImages = ["sunrise","Sunset","nightView-2"]
    var pageContent = ["Do you have ever been to there ? if not , hurry go right now . ", "Explore unknown place , look for your fantasy attractions","Don't forget . bring your friends and share to others."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataSource = self
        //create first 導引畫面
        if let staringViewController = viewControllerAtIndex(index: 0) {
            setViewControllers([staringViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //after & before 僅做類似換頁功能 , 實際要顯示的內容是由這建立
    func viewControllerAtIndex(index: Int) -> ContentViewController? {
        if index == NSNotFound || index < 0 || index >= pageheader.count {
            return nil
        }
        
        //create new view controller and Transmission of information
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "contentviewcontroller") as? ContentViewController {
            pageContentViewController.imagefile = pageImages[index]
            pageContentViewController.head = pageheader[index]
            pageContentViewController.content = pageContent[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    // UIPageViewController 會跟DataSource請求要顯示的資料 after & before
    
    internal func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentViewController).index
        index += 1
        return viewControllerAtIndex(index: index)
    }
    
    internal func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentViewController).index
        index -= 1
        return viewControllerAtIndex(index: index)
    }
    
    // create  default page indicator
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return pageheader.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "contentviewcontroller") as? ContentViewController {
//            return pageContentViewController.index
//        }
//        return 0
//    }

    
    func forward(index: Int){
        if let nextViewController = viewControllerAtIndex(index: index+1){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
