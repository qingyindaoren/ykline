//
//  YKNewsListViewController.swift
//  ICO
//
//  Created by yunke on 2018/2/26.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKNewsListViewController: YKBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable(className:"UITableView")
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - navStatusHeight() - newsTitleHeight - tabBarHeight())
        // Do any additional setup after loading the view.
        tableView?.register(YKNewsTableViewCell.classForCoder(), forCellReuseIdentifier: YKNewsId)
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
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0*scale
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YKNewsId, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = ykrandomColor()
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let v = YKCoinDetailViewController()
        
        navigationController?.pushViewController(v, animated: true)
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
