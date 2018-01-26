//
//  YKHomeViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

import Alamofire

class YKHomeViewController: YKBaseViewController {
    @objc private func didClickPush(btn: UIButton){
        let v = ViewController()
        v.view.backgroundColor = ykrandomColor()
        navigationController?.pushViewController(v, animated: true)
  
      
    }
   
    
   private lazy var pushBtn: UIButton = {
       let btn = UIButton(title: "push", fontSize: 30.0, textColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
   
    btn.addTarget(self, action: #selector(didClickPush(btn:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()

    }
    private func setupUI(){
        view.addSubview(pushBtn)
        pushBtn.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
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
