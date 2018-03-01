//
//  UIImage+Extension.swift
//  Weibo2
//
//  Created by teacher on 16/11/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func  snapShotCurrentWindow() -> UIImage {
        //截屏
        let window = UIApplication.shared.keyWindow!
        //开启图片的上下文
        UIGraphicsBeginImageContextWithOptions(window.frame.size, false, 0)
        //将当前的window绘制到图形的上下文
        window.drawHierarchy(in: window.frame, afterScreenUpdates: true)
        //从图片的上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //关闭图片的上下文
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    
    //将图片比例缩放到指定宽度
    func scaleImage(width: CGFloat) -> UIImage{
        let imageW = self.size.width
        let imageH = self.size.height
        //需要判断 如果图片的宽度小于缩放的宽度 就不需要缩放
        if imageW < width {
            return self
        }
        
        let scaleH = imageH / imageW * width
        let imageBounds = CGRect(x: 0, y: 0, width: width, height: scaleH)
        //开启图片的上下文
        UIGraphicsBeginImageContextWithOptions(imageBounds.size, false, 0)
        //将图片绘制上下文中
        self.draw(in: imageBounds)
        
        //从上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //关闭图片的上下文
        UIGraphicsEndImageContext()
        return image!
    }
    //压缩 等宽高
    func scaleImageEquelWH(width: CGFloat) -> UIImage{
        let newSize = CGSize.init(width: width, height: width)
        UIGraphicsBeginImageContext(newSize);
        self.draw(in: CGRect.init(x: 0, y: 0, width: width, height: width))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
