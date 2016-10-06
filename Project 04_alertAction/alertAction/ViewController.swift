//
//  ViewController.swift
//  alertAction
//
//  Created by yumin on 2016/9/19.
//  Copyright © 2016年 yumin8312. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var test = ["test1","test2","test3","test4","test5"]
    var mark = [Bool](repeating: false, count: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = test[indexPath.row]
        
        cell.accessoryType = mark[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //creat a menu of similar list
        let optionMenu = UIAlertController(title: nil, message: "what do you want to do?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        // add action in menu
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        let feedbackHandler = {(action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Error", message: "you can call "+"0800-000-00\(indexPath.row)", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let feedback = UIAlertAction(title: "Feedback", style: .default, handler: feedbackHandler)
        
        
        let markAction = UIAlertAction(title: "Mark", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
            self.mark[indexPath.row] = self.mark[indexPath.row] ?  false : true
            cell?.accessoryType = self.mark[indexPath.row] ? .checkmark : .none
        })
        
        //creat action button
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(feedback)
        optionMenu.addAction(markAction)
        //appear menu
        self.present(optionMenu, animated: true, completion:  nil)
    }
    
    @IBAction func alert() {
        let alertmaessage = UIAlertController(title: "", message: "Hello", preferredStyle: .alert)
        //creat return button
        alertmaessage.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        self.present(alertmaessage, animated: true, completion: nil)
    }
    
}

