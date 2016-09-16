//
//  ViewController.swift
//  baseCell
//
//  Created by yumin on 2016/9/16.
//  Copyright © 2016年 yumin8312. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var text = ["test1","test2","test3","test4","test5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - TableView
    
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1        //default value = 1
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = text[indexPath.row]
        
        return cell
    }
    
    
}

