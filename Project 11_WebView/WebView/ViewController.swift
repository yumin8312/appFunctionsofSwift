//
//  ViewController.swift
//  WebView
//
//  Created by yumin on 2016/10/6.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var sectionTitles = ["Mobile Safari","UIWebView","SFSafariViewController"]
    var sectionContent = [["Apple_iTunes_App Store","Google Paly"],["AppCoda","",""],["My-github","","",""]]
    var links = ["https://github.com/yumin8312/appFunctionsofSwift","",""]
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3    //要呈現三種WebView方法 sectionTitles
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1{
            return 3
        }else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        //Mobile Safari block
        case 0:
            if indexPath.row == 0 {
                if let url = NSURL(string: "http://www.apple.com/tw/itunes/charts/free-apps/"){
                    UIApplication.shared.open(url as URL)
                }
            }else if indexPath.row == 1 {
                if let url = NSURL(string: "https://play.google.com/store/apps?utm_source=apac_med&utm_medium=hasem&utm_content=May2516&utm_campaign=Evergreen&pcampaignid=MKT-DR-apac-tw-all-med-hasem-py-Evergreen-May2516-1-BKWS%7CONSEM_kwid_43700011378110954&gclid=Cj0KEQjw7Ne_BRDRmP2ojKfzv98BEiQAPuqPyZUV3PAbKbZ3XGbTdjs2ssIC5JfUJbObDk12c6RJt44aAqTH8P8HAQ&gclsrc=aw.ds"){
                    UIApplication.shared.open(url as URL)
                }
            }
        //UIWebView block
        case 1:
            if indexPath.row == 0 {
                performSegue(withIdentifier: "showwebview", sender: self)
            }
        //SFSafariViewController block
        case 2:
            if let url = NSURL(string: links[indexPath.row]){
                let safariController = SFSafariViewController(url: url as URL, entersReaderIfAvailable: true)
                present(safariController, animated: true, completion: nil)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

