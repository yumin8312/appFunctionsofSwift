//
//  BackTableVC.swift
//  side-out menu
//
//  Created by yumin on 2016/10/11.
//  Copyright © 2016年 yumin. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["others", "taiwanCity", "images"]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableArray[indexPath.row], for: indexPath)
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
}
