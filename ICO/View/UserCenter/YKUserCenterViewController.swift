//
//  YKUserCenterViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKUserCenterViewController: YKBaseViewController {
    private lazy var btn:UIButton = {
        let btn = UIButton();
        btn.setTitle("仿微信相机", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(push), for: .touchUpInside)
        return btn;
    }()
    @objc private func push(){
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(btn);
        btn.snp.makeConstraints { (make) in
            make.center.equalTo(view);
        }
        // Do any additional setup after loading the view.
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
