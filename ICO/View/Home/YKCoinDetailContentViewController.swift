//
//  YKCoinDetailContentViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/31.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKCoinDetailContentViewController: YKCoinBaseViewController {
    override func viewDidLayoutSubviews() {
  
        // Do any additional setup after loading the view.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                creatTable(className: "UITableView")
//        creatTable(className:"YKCoinDetailContentTableView")
     
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height:ScreenHeight -  detailSectionHeight - navStatusHeight()-dangerousHeight() )

        // Do any additional setup after loading the view.
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: YKCoinDetailContentId)




       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: YKCoinDetailContentId, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = ykrandomColor()
        // Configure the cell...
        cell.textLabel?.text = "CionDetailView - ChildVCOne - - "+"\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let v = YKCoinDetailViewController()
//        
//        navigationController?.pushViewController(v, animated: true)
    }
   


}

