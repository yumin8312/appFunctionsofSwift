//
//  DetailViewController.swift
//  navigationController
//
//  Created by yumin on 2016/9/27.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var detailimaged: UIImageView!
    
    var detailimages = ""
    var detailname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailimaged.image = UIImage(named: detailimages)
        title = detailname
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.detailnameLabel.text = "Image :"
            cell.detailvalueLabel.text = detailname
        case 1:
            cell.detailnameLabel.text = "Location :"
            cell.detailvalueLabel.text = ""
        case 2:
            cell.detailnameLabel.text = "Type :"
            cell.detailvalueLabel.text = ""
        case 3:
            cell.detailnameLabel.text = "Date :"
            cell.detailvalueLabel.text = ""
        default:
            cell.detailnameLabel.text = ""
            cell.detailvalueLabel.text = ""
        }
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
