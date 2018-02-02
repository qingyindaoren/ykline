//
//  YKCoinBaseViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/31.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

protocol YKCoinBaseVCDelegate: class {
    func coinBaseScrollViewDidScroll(scrollView:UIScrollView)
}

class YKCoinBaseViewController: YKBaseTableViewController {
    
weak var delegate: YKCoinBaseVCDelegate?
    private var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(pageTitleViewToTop), name: NSNotification.Name(rawValue: "pageTitleViewToTop"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc private func pageTitleViewToTop(){
        scrollView?.contentOffset = .zero
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if self.scrollView == nil {
        self.scrollView = scrollView
    }
    self.delegate?.coinBaseScrollViewDidScroll(scrollView: scrollView)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //        let isEnable = gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
        //        print(isEnable)
        //        return isEnable
        
        
        return true
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
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
