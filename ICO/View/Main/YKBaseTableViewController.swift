//
//  YKTableViewController.swift
//  Example
//
//  Created by yunke on 2018/1/30.
//  Copyright © 2018年 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

class YKBaseTableViewController:YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
   public var tableView: UITableView?
    func creatTable(className:String){
        if className == "UITableView" {
            tableView = (NSClassFromString(className) as! UITableView.Type).init(frame:.zero)
        }else {
          tableView =  (NSClassFromString(namespace + "." + className) as! UITableView.Type).init(frame:.zero)
        }
        
        
       
        
        tableView?.separatorStyle = .none
        tableView?.backgroundColor = UIColor.clear
        //        print(tableView)
        //        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
//        tableView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
     
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.selectionStyle = .none
        // Configure the cell...
        
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
