//
//  YKCoinDetailViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/31.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit
import SGPagingView
class YKCoinDetailViewController: YKBaseTableViewController {
    
    private var childVCScrollView:UIScrollView?
   private  var sectionTitleArray = ["K线图","详情","全部价格"]
    private var childArr:[UIViewController] = []
    private var currentIndex: Int?
    private  lazy var topView: UIView = {
       let v = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: coinDetailtopViewHeight))
        v.backgroundColor = ykrandomColor()
        return v
    }()
  
    private  lazy var pageTitleView: SGPageTitleView = {
        let configuration = SGPageTitleViewConfigure()
        configuration.titleColor = .gray
        configuration.titleSelectedColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        configuration.indicatorColor = UIColor.clear
   
        let t = SGPageTitleView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: detailSectionHeight) , delegate: self, titleNames: self.sectionTitleArray, configure: configuration)
        t?.isShowIndicator = false
        t?.isOpenTitleTextZoom = true
        t?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return t!
    }()
    private lazy var pageContentView: SGPageContentView = {
        let content = SGPageContentView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: self.view.height - detailSectionHeight), parentVC: self, childVCs: self.childArr)
        content?.delegatePageContentView = self
     
        return content!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    private func setupUI(){

              creatTable(className:"YKCoinDetailTableView")
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - navStatusHeight() )
        tableView?.tableHeaderView = self.topView

        tableView?.sectionHeaderHeight = detailSectionHeight
        tableView?.showsVerticalScrollIndicator = false

        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: YKCoinDetailCellId)
        for newsTitle in sectionTitleArray {
           
            if newsTitle == "K线图"{
             let   coinType = YKKLineViewController()
                coinType.title = newsTitle
                self.childArr.append(coinType)
            }else{
          let   coinType =  YKCoinDetailContentViewController()
                coinType.delegate = self
                coinType.title = newsTitle
                self.childArr.append(coinType)
            }
            
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YKCoinDetailCellId, for: indexPath)
        cell.selectionStyle = .none
        // Configure the cell...
        cell.contentView.addSubview(self.pageContentView)
        return cell
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.pageTitleView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return self.view.height - detailSectionHeight
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        if let childV = self.childVCScrollView {
            if  childV.contentOffset.y > 0 && self.currentIndex != 0{
                self.tableView?.contentOffset = CGPoint(x: 0, y: coinDetailtopViewHeight)// 父视图，悬浮效果
            }
        }
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < coinDetailtopViewHeight {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pageTitleViewToTop"), object: nil)//禁止子视图滚动，让父视图滚动
        }
  
    }



}
extension YKCoinDetailViewController:YKCoinBaseVCDelegate{
    func coinBaseScrollViewDidScroll(scrollView: UIScrollView) {
        self.childVCScrollView = scrollView
        if (self.tableView?.contentOffset.y)! < coinDetailtopViewHeight {
            scrollView.contentOffset = .zero//禁止子视图滚动，
            scrollView.showsVerticalScrollIndicator = false
        }else {
            self.tableView?.contentOffset = CGPoint(x: 0, y: coinDetailtopViewHeight)//悬浮效果
            scrollView.showsVerticalScrollIndicator = true//让子视图滚动
        }
    }
}
// MARK: - SGPageTitleViewDelegate
extension YKCoinDetailViewController: SGPageTitleViewDelegate, SGPageContentViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
    
        self.pageContentView.setPageCententViewCurrentIndex(selectedIndex)
        self.currentIndex = selectedIndex
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.tableView?.isScrollEnabled = false
        self.pageTitleView.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    self.currentIndex = targetIndex
    }
    func pageContentView(_ pageContentView: SGPageContentView!, offsetX: CGFloat) {
        self.tableView?.isScrollEnabled = true
//        if offsetX == 0 {
//             self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//        }else{
//             self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        }
   
    
    }
}
class YKCoinDetailTableView: UITableView,UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let isEnable = gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
//        print(isEnable)
        return isEnable
 
    }

}

