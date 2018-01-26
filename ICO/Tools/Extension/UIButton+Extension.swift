
//
//  UIButton+Extension.swift
//  Weibo2
//
//  Created by teacher on 16/11/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UIButton {
    
    
    /// 快速构造UIButton对象
    ///
    /// - Parameters:
    ///   - title: 文字
    ///   - fontSize: 字体大小
    ///   - textColor: 字体颜色
    convenience init(title: String, fontSize: CGFloat,textColor: UIColor) {
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = yksysFont(font: fontSize)
        self.setTitleColor(textColor, for: .normal)
    }
    
    
    
}

