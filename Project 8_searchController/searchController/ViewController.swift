//
//  ViewController.swift
//  searchController
//
//  Created by yumin on 2016/10/3.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    var searchController : UISearchController!
    
    @IBOutlet var tableView: UITableView!
    
    var searchResults = [String]()
    
    var taiwanCity = ["臺北市 Taipei City","新北市 New TaipeiCity","桃園市 Taoyuan City ","臺中市 Taichung City","臺南市 Tainan City","高雄市 Kaohsiung City ","宜蘭縣 Yilan County","宜蘭市 YilanCity ","新竹縣 Hsinchu County ","苗栗縣 Miaoli County ","苗栗市 Miaoli City ","彰化縣 Changhua County","彰化市 Changhua City ","南投縣 Nantou County ","南投市 Nantou City ","雲林縣 Yunlin County","嘉義縣 Chiayi County","屏東縣 Pingtung County","屏東市 Pingtung City","臺東縣 Taitung County ","臺東市 Taitung City","花蓮縣 Hualien County ","花蓮市 HualienCity","澎湖縣 Penghu County","基隆市 Keelung City","新竹市 Hsinchu City","嘉義市 Chiayi City","連江縣 Lienchiang County","金門縣 Kinmen County"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        //custom search bar
        
//        searchController.dimsBackgroundDuringPresentation = true
//        searchController.searchBar.prompt = "就是這一行文字..."
//        searchController.searchBar.placeholder = "Search here..."
//        searchController.searchBar.tintColor = UIColor.red
//        searchController.searchBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Table View DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        }else{
            return taiwanCity.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let Active = (searchController.isActive) ? searchResults : taiwanCity
        cell.textLabel?.text = Active[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        }else{
            return true
        }
    }
    
    //MARK: - Search
    
    //Filter
    func filterContentForSearchText(searchText: String){
        //用searchResults[]來儲存被過濾後的data
        searchResults = taiwanCity.filter({ (city) -> Bool in
            let cityname = city.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return cityname != nil
        })
    }
    
    //Update
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText: searchText)
            tableView.reloadData()
        }
    }
    
    
}

