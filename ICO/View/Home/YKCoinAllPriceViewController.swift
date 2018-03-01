//
//  YKCoinAllPriceViewController.swift
//  ICO
//
//  Created by yunke on 2018/2/7.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKCoinAllPriceViewController: YKCoinBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable(className: "UITableView")
        //        creatTable(className:"YKCoinDetailContentTableView")
        
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height:ScreenHeight -  detailSectionHeight - navStatusHeight()-dangerousHeight() )
        
        // Do any additional setup after loading the view.
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: YKCoinDetailContentAllPriceId)
        
        
        
        
        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YKCoinDetailContentAllPriceId, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = ykrandomColor()
        // Configure the cell...
        cell.textLabel?.text = "CionDetailView - ChildVCTwo - - "+"\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let v = YKCoinDetailViewController()
        //
        //        navigationController?.pushViewController(v, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
