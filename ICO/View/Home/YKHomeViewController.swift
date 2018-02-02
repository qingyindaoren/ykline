//
//  YKHomeViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit


import Alamofire
import SGPagingView

class YKHomeViewController: YKBaseViewController {
    /// 标题和内容
  private  var pageTitleView: SGPageTitleView?
 private   var pageContentView: SGPageContentView?
    
private var  titleArray = ["自选","市值","涨幅","BTC","BCH","LTC","ETH"]
   
    

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
  
       
   
        addPageView()
           setupUI()

    }
   
    private func setupUI(){

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "home_hover", target: self, action: #selector(didClickToSearch))
  
    }
    private func addPageView(){
        
        let configuration = SGPageTitleViewConfigure()
        configuration.titleColor = .gray
        configuration.titleSelectedColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        configuration.indicatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        configuration.indicatorHeight = indicatorHeight
        configuration.titleFont = yksysFont(font: 34.0)
        configuration.indicatorStyle = SGIndicatorStyleDynamic
        configuration.spacingBetweenButtons = newsTitleMargin;
        configuration.indicatorDynamicWidth = newsIndicatorWidth
        // 标题名称的数组
        
        self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0.0, y: 0.0, width: Double(ScreenWidth), height: Double(newsTitleHeight) ), delegate: self , titleNames: titleArray, configure: configuration)    
        
        self.pageTitleView!.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.view.addSubview(self.pageTitleView!)
        //根据不同类型创建不同的控制器
        for newsTitle in titleArray {
            let coinType =  YKCoinViewController()
            coinType.title = newsTitle
            self.addChildViewController(coinType)
        }
        // 内容视图
        self.pageContentView = SGPageContentView(frame: CGRect(x: 0, y: newsTitleHeight, width: ScreenWidth, height: self.view.height - newsTitleHeight - tabBarHeight() - navStatusHeight()), parentVC: self, childVCs: self.childViewControllers)
        self.pageContentView!.delegatePageContentView = self
        self.view.addSubview(self.pageContentView!)
    }
    @objc private func didClickToSearch(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

// MARK: - SGPageTitleViewDelegate
extension YKHomeViewController: SGPageTitleViewDelegate, SGPageContentViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageCententViewCurrentIndex(selectedIndex)
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
    func pageContentView(_ pageContentView: SGPageContentView!, offsetX: CGFloat) {

            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

    }
}
