//
//  ViewController.swift
//  exCoreData
//
//  Created by yumin on 25/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var listItem = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(TableViewController.addItem))
    }
    
    func addItem() {
        let alertController = UIAlertController(title: "Create...", message: "Something...", preferredStyle: .alert )
        
        
        // cofirm action
        let  cofirmaction = UIAlertAction(title: "cofirm", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            if let field = alertController.textFields?[0]  {
                self.saveItem(itemToSave: field.text!)
                self.tableView.reloadData()
            }
        })
        
        // cancel action (取消鍵)
        let cancelaction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        //input textfield
        alertController.addTextField(configurationHandler: {
            (textField) in
            textField.placeholder = "create in something!!!"
        })
        
        // add action  to alertController
        alertController.addAction(cofirmaction)
        alertController.addAction(cancelaction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func saveItem(itemToSave: String){
        //gain AppDelegate object
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        //call insert NewObject for Entity For Name  -> create managedObject
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContext!)
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        // add new data to ListEntity(datavase) -> name
        item.setValue(itemToSave, forKey: "name")
        
        do{
            try managedContext?.save()  //save to database
            listItem.append(item)
        }catch{
            print("error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //gain AppDelegate object
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        
        do{
            let results = try managedContext?.fetch(fetchRequest)
            listItem = results as! [NSManagedObject]
        }catch{
            print("error")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        // delete action animation
        tableView.reloadRows(at: [indexPath], with: .right)
        
        //delete action
        managedContext?.delete(listItem[indexPath.row])
        listItem.remove(at: indexPath.row)
        do{
            try managedContext?.save()  //save to database
        }catch{
            print("error")
        }
        
        //update
        self.tableView.reloadData()
    }
    
    
    //MARK: - tableview delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = listItem[indexPath.row]
        cell.textLabel?.text = item.value(forKey: "name") as! String?
        
        return cell
    }
    
}
