//
//  ViewController.swift
//  jumpbar
//
//  Created by yumin on 20/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titlebar = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlebar.count   //因為是依照titlebar分類,26個字母=26個section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //display cell's title header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return titlebar[section]
    }
    
    //display side bar [a-z]
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titlebar
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        var thIndex:Int = 0
        //這裡是將 title header & titlebar[] 內的字元做比對,若相同就快速跳到該字元的title header
        for character in titlebar {
            if character == title {
                return thIndex
            }
            thIndex += 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

