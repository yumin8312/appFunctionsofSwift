//
//  taiwanCity.swift
//  side-out menu
//
//  Created by yumin on 2016/10/11.
//  Copyright © 2016年 yumin. All rights reserved.
//

import Foundation

class taiwanCity: UITableViewController {
    
    var taiwanCity = ["臺北市 Taipei City","新北市 New TaipeiCity","桃園市 Taoyuan City ","臺中市 Taichung City","臺南市 Tainan City","高雄市 Kaohsiung City ","宜蘭縣 Yilan County","宜蘭市 YilanCity ","新竹縣 Hsinchu County ","苗栗縣 Miaoli County ","苗栗市 Miaoli City ","彰化縣 Changhua County","彰化市 Changhua City ","南投縣 Nantou County ","南投市 Nantou City ","雲林縣 Yunlin County","嘉義縣 Chiayi County","屏東縣 Pingtung County","屏東市 Pingtung City","臺東縣 Taitung County ","臺東市 Taitung City","花蓮縣 Hualien County ","花蓮市 HualienCity","澎湖縣 Penghu County","基隆市 Keelung City","新竹市 Hsinchu City","嘉義市 Chiayi City","連江縣 Lienchiang County","金門縣 Kinmen County"]
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taiwanCity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = taiwanCity[indexPath.row]
        
        return cell
    }
    
    
}
