//
//  YKBaseNavigationController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , NSAttributedStringKey.font : yksysFont(font: 17.0)]
        navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navigationBar.isTranslucent = false
//        self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
//        self.interactivePopGestureRecognizer?.isEnabled = true
   
    }
    //重写push方法
    //说明UINavigationController(rootViewController:) 内部执行了push的操作
    override func pushViewController (_ viewController: UIViewController, animated: Bool) {
        let count = childViewControllers.count
        if count > 0 {
            //统一操作
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"返回",imageName: "home_hover", target: self, action: #selector(back))
            //隐藏底部的tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back() {
        popViewController(animated: true)
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
