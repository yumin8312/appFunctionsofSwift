//
//  ViewController.swift
//  PulltoRefresh
//
//  Created by yumin on 2016/10/12.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview:UITableView!
    var refreshControl = UIRefreshControl()
    var refreshstatus = true
    
    var data = ["0123456789","😀😂😅😇😍","😎😡😱😭💩","please pull to refresh"]
    var data2 = ["12345","abcdefg","ㄅㄆㄇㄈ","😀😆😋😜😏","😳🙁😮😢🤐","😈👽😼👾🤖","refresh done!"]
    
    func refreshData() {
        refreshstatus = false
        self.tableview.reloadData()
        //停止刷新动作
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableview.separatorColor = UIColor.clear
        
        refreshControl.tintColor = UIColor.blue
        refreshControl.attributedTitle = NSAttributedString(string: "refreshing")
        
        refreshControl.addTarget(self, action: #selector(ViewController.refreshData), for: UIControlEvents.valueChanged)
        
        tableview.addSubview(refreshControl)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if refreshstatus {
            return data.count
        } else {
            return data2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! refreshTableViewCell
        
        cell.backgroundColor = UIColor(red: 255.0/255.0, green: 179.0/255.0, blue: 179.0/255.0, alpha: 1.0)
        
        if refreshstatus {
            cell.dataLabel.text = data[indexPath.row]
        } else {
            cell.dataLabel.text = data2[indexPath.row]
        }
        
        return cell
    }

}

