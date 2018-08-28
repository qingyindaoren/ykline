//
//  YKKlineViewController.swift
//  ICO
//
//  Created by yunke on 2018/3/2.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit
import SGPagingView
class YKKlineViewController: YKBaseTableViewController {

    private var childVCScrollView:UIScrollView?
    private  var sectionTitleArray = ["新闻","公告","简介"]
    private var childArr:[UIViewController] = []

    private  lazy var topView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: klineTopHeight))
        v.backgroundColor = ykrandomColor()
        return v
    }()
    
    private  lazy var pageTitleView: SGPageTitleView = {
        let configuration = SGPageTitleViewConfigure()
        configuration.titleColor = .gray
        configuration.titleSelectedColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //        configuration.indicatorColor = UIColor.clear
        
        let t = SGPageTitleView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: detailSectionHeight) , delegate: self, titleNames: self.sectionTitleArray, configure: configuration)
        t?.isNeedBounces = false
        t?.isShowIndicator = false
        t?.isOpenTitleTextZoom = true
        t?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return t!
    }()
    private lazy var pageContentView: SGPageContentView = {
        let content = SGPageContentView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: self.view.height - detailSectionHeight-dangerousHeight()), parentVC: self, childVCs: self.childArr)
        content?.delegatePageContentView = self
     
        return content!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    private func setupUI(){
        
        creatTable(className:"YKKlineDetailTableView")
        self.tableView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - navStatusHeight()-dangerousHeight() )
        tableView?.tableHeaderView = self.topView
        
        tableView?.sectionHeaderHeight = detailSectionHeight
        tableView?.showsVerticalScrollIndicator = false
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: YKKlineCellId)
        for newsTitle in sectionTitleArray {
            
            if newsTitle == "新闻"{
                let   coin = YKSubNewsViewController()
              coin.delegate = self
                coin.title = newsTitle
                self.childArr.append(coin)
            }else if newsTitle == "公告"{
                let   coin =  YKSubPublicViewController()
                coin.delegate = self
                coin.title = newsTitle
                self.childArr.append(coin)
            }else if newsTitle == "简介"{
                let coin = YKSubBriefViewController()
                coin.delegate = self
                coin.title = newsTitle
                self.childArr.append(coin)
            }
            
            
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: YKKlineCellId, for: indexPath)
        cell.selectionStyle = .none
        // Configure the cell...
        cell.contentView.addSubview(self.pageContentView)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.pageTitleView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let h =  self.view.height - detailSectionHeight-dangerousHeight()
        return  h
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let childV = self.childVCScrollView {
            if  childV.contentOffset.y > 0 {
                self.tableView?.contentOffset = CGPoint(x: 0, y: klineTopHeight)// 父视图，悬浮效果
            }
        }
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < klineTopHeight {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pageTitleViewToTop"), object: nil)//禁止子视图滚动，让父视图滚动
        }
        
    }
    
    
    
}
extension YKKlineViewController:YKCoinBaseVCDelegate{
    func coinBaseScrollViewDidScroll(scrollView: UIScrollView) {
        self.childVCScrollView = scrollView
        if (self.tableView?.contentOffset.y)! < klineTopHeight {
            scrollView.contentOffset = .zero//禁止子视图滚动，
            scrollView.showsVerticalScrollIndicator = false
        }else {
            self.tableView?.contentOffset = CGPoint(x: 0, y: klineTopHeight)//悬浮效果
            scrollView.showsVerticalScrollIndicator = true//让子视图滚动
        }
    }
}
// MARK: - SGPageTitleViewDelegate
extension YKKlineViewController: SGPageTitleViewDelegate, SGPageContentViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        
        self.pageContentView.setPageCententViewCurrentIndex(selectedIndex)
    
        self.tableView?.reloadData()
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.tableView?.isScrollEnabled = false
        self.pageTitleView.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
     
        self.tableView?.reloadData()
    }
    func pageContentView(_ pageContentView: SGPageContentView!, offsetX: CGFloat) {
        self.tableView?.isScrollEnabled = true
        //        if offsetX == 0 {
        //             self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        //        }else{
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        //        }
        
        
    }
}
class YKKlineDetailTableView: UITableView,UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let isEnable = gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
        //        print(isEnable)
        return isEnable
        
    }
    
}
