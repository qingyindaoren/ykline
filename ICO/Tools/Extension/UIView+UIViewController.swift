//
//  UIView+UIViewController.swift
//  Weibo2
//
//  Created by teacher on 16/11/25.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UIView {
    
    
    
    //视图层次嵌套比较深的时候 使用代理或者闭包的时候会比较麻烦 可以使用这种方式来解决
    //遍历响应者链条 查找对应的控制器(导航, tabbarVC,tableVC)
    
    //查找导航视图控制器
    func findNavController() -> UINavigationController? {
        
        //1. 获取当前控件的下一个响应者
        var responder = self.next
        
        while responder != nil {
            if let obj = responder as? UINavigationController {
                return obj
            }
            
            //如果不是  就查找下一个响应者的下一个响应者
            responder = responder?.next
        }
        
        return nil
    }
}
