//
//  TableViewController.swift
//  searchController
//
//  Created by yumin on 2016/10/3.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var taiwainCity = ["臺北市 Taipei City","新北市 New TaipeiCity","桃園市 Taoyuan City ","臺中市 Taichung City","臺南市 Tainan City","高雄市 Kaohsiung City ","宜蘭縣 Yilan County","宜蘭市 YilanCity ","新竹縣 Hsinchu County ","苗栗縣 Miaoli County ","苗栗市 Miaoli City ","彰化縣 Changhua County","彰化市 Changhua City ","南投縣 Nantou County ","南投市 Nantou City ","雲林縣 Yunlin County","嘉義縣 Chiayi County","屏東縣 Pingtung County","屏東市 Pingtung City","臺東縣 Taitung County ","臺東市 Taitung City","花蓮縣 Hualien County ","花蓮市 HualienCity","澎湖縣 Penghu County","基隆市 Keelung City","新竹市 Hsinchu City","嘉義市 Chiayi City","連江縣 Lienchiang County","金門縣 Kinmen County"]
    
     var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
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
        return taiwainCity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = taiwainCity[indexPath.row]

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
