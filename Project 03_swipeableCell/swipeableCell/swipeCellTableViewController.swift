//
//  swipeCellTableViewController.swift
//  swipeableCell
//
//  Created by yumin on 2016/9/17.
//  Copyright © 2016年 yumin8312. All rights reserved.
//

import UIKit

class swipeCellTableViewController: UITableViewController {
    
    var name = ["SunRise","SunSet","Sketch","Butterfly Bridge","Valentine Bridge","Fort Zeelandia","nightView_2","nightView","TreeArt","TreeHouse_2","TreeHouse","ZhongShan"]
    
    var imaged = ["sunrise","Sunset","Sketch","ButterflyBridge","Valentine Bridge","FortZeelandia","nightView-2","nightView","treeArt","treehouse-2","treehouse","Zhongshan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imaged.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! swipeCellTableViewCell

        // Configure the cell...
        cell.nameLabel.text = name[(indexPath as NSIndexPath).row]
        cell.imagedView.image = UIImage(named: imaged[(indexPath as NSIndexPath).row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //add share button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "📮", handler: { (action, indexPath) -> Void in
            
            let defaultText = ""
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            })
    
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "🗑", handler: {(action, indexPath) -> Void in
            
            self.name.remove(at: indexPath.row)
            self.imaged.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        })
        
        
        let moreAction = UITableViewRowAction(style: .default, title: "More", handler: {(action, indexPath) -> Void in
            //nothing action
        })
        
        
        //set coustom button
        shareAction.backgroundColor = UIColor.yellow
        deleteAction.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 255.0, alpha: 1.0)
        moreAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        
        return[shareAction, deleteAction, moreAction]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            name.removeAtIndex(indexPath.row)
            imaged.removeAtIndex(indexPath.row)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
