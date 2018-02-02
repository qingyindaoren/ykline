//
//  YKBaseViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

open class YKBaseViewController: UIViewController,UIGestureRecognizerDelegate{

    override open func viewDidLoad() {
        super.viewDidLoad()
  self.view.backgroundColor = ykrandomColor()
     
        self.hideLine()
        // Do any additional setup after loading the view.
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self 
       self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  //取消侧滑
//        if self.navigationController?.interactivePopGestureRecognizer?.isEnabled == true {
//            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        }
    }
//    - (UIInterfaceOrientationMask)supportedInterfaceOrientations
//    {
//    return UIInterfaceOrientationMaskLandscape;
//    }
//    - (BOOL)shouldAutorotate
//    {
//    return NO;
//    }

    override open func didReceiveMemoryWarning() {
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

extension YKBaseViewController:reloadDelegate{
    override open func viewWillAppear(_ animated: Bool) {
        AlamofireMenager.shared.ykNoNetv.noNetdelegate = self
    }
}
