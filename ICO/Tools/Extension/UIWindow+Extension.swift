//
//  UIWindow+Extension.swift
//  ICO
//
//  Created by yunke on 2018/1/24.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit
let lastKey = "lastKey"
extension UIWindow{
    func swichRootViewController(){
        let key = "CFBundleShortVersionString"
        let lastVersion: String = (UserDefaults.standard.object(forKey: lastKey) ?? "") as! String
        let currentVersion = Bundle.main.infoDictionary![key] as! String
        if currentVersion == lastVersion {
            self.rootViewController = YKTabBarController()
    
   
        }else{
//            新版本
            UserDefaults.standard.set(currentVersion, forKey: lastKey)
            UserDefaults.standard.synchronize()
            //删除用户信息
            rootViewController = YKGuideViewController()
        
        }
        
    }
  
}
