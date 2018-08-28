//
//  YKTabBarController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        // Do any additional setup after loading the view.
               addChildViewControllers()
    }

    //添加子视图控制器
    //private 不希望外界能够访问到该方法, 只能在本类中访问
    private func addChildViewControllers() {
        let vc = YKHomeViewController()
//        vc.isRightEdge = true
        addChildViewController(vc: vc, title: "行情", imageName: "home_hover",index:0)
      
        addChildViewController(vc: YKInfomationViewController(), title: "资讯", imageName: "home_hover",index:1)
          addChildViewController(vc: YKVirtualViewController(), title: "虚拟盘", imageName: "home_hover",index:2)
        addChildViewController(vc: YKUserCenterViewController(), title: "个人", imageName: "home_hover",index:3)
    }
    
    //MARK: 添加子视图控制器
    private func addChildViewController(vc: UIViewController, title: String, imageName: String,index: Int) {
        
        //设置title
        //vc.title = "首页"
        //需要同时设置title和图片才能够显示
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.tag = index
        //设置选中的image
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //设置文字颜色
        
      
          vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : yksysFont(font: 10.0)], for: .normal)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
//        vc.tabBarItem.badgeValue = "10"
//        vc.tabBarItem.badgeValue = nil
//        vc.tabBarItem.badgeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        vc.tabBarItem.title = title
        vc.navigationItem.title = title
        
        //设置图片的偏移
        //vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        //2.将tableVC包装到 导航控制器
        let nav = YKBaseNavigationController(rootViewController: vc)
        //3.将导航控制器添加到 UITabBarController对象的子视图控制器
        self.addChildViewController(nav)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print(item.tag)
        //1.应该获取到被点击的UITabBarButton
        var index = 0
        for subView in tabBar.subviews {
            if subView.isKind(of: NSClassFromString("UITabBarButton")!) {
                if index == item.tag {
                    //可以获取到被点击tabbarButton
                    //遍历子视图
                    for v in subView.subviews {
                        if v.isKind(of: NSClassFromString("UIImageView")!) {
//                            print("终于找到你,还好没放弃\(v)")
                            //线缩小
                            v.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
                            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: [], animations: {
                                v.transform = CGAffineTransform.identity
                            }, completion: { (_) in
//                                print("👌")
                            })
                        }
                    }
                }
                index += 1
            }
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
