//
//  YKSubPublicViewController.swift
//  ICO
//
//  Created by yunke on 2018/3/2.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKSubPublicViewController: YKCoinBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable(className: "UITableView")
        
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height:ScreenHeight -  detailSectionHeight - navStatusHeight()-dangerousHeight() )
        
        // Do any additional setup after loading the view.
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: YKSubPublicCellId)
        
        
        
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: YKSubPublicCellId, for: indexPath)
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

}
