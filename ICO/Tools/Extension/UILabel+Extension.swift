//
//  UILabel+Extension.swift
//  Weibo2
//
//  Created by teacher on 16/11/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UILabel {
    //cmd + option + /
    
    /// 快速构造label对象
    ///
    /// - Parameters:
    ///   - title: 文字
    ///   - fontSize: 字体大小
    ///   - textColor: 字体颜色
    convenience init(title: String, fontSize: CGFloat,textColor: UIColor) {
        self.init()
        self.text = title
        self.font = yksysFont(font: fontSize)
        self.textColor = textColor
        self.sizeToFit()
    }
}
