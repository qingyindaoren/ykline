//
//  YKGuideViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/24.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit


class YKGuideViewController: UIViewController,UIScrollViewDelegate {
private    let scrollview:UIScrollView = UIScrollView()
 private   let pots: FDSPageControl = {
     let p = FDSPageControl()
       p.currentPage = 0
        p.pageIndicatorTintColor = ykColor(rgbValue: 0x969696, alpha: 1.0)
        p.currentPageIndicatorTintColor = ykColor(rgbValue:0x333333, alpha: 1.0)
        p.hidesForSinglePage = true
    
        return p
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
         addProgressPoint()
     addScrollview()
       
        
        // Do any additional setup after loading the view.
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       pots.currentPage = (NSInteger(scrollView.contentOffset.x) + NSInteger(ScreenWidth * 0.5)) / NSInteger(ScreenWidth)
        print(pots.currentPage)
    }
    private func addScrollview(){
        scrollview.frame = self.view.bounds
        view .addSubview(scrollview)
        let  scrollW :CGFloat = scrollview.width
        let scrollH: CGFloat = scrollview.height
        for i in 0..<guideCount {
            let imageView :UIImageView = UIImageView()
            imageView.width = scrollW
            imageView.height = scrollH
            imageView.y = 0
            imageView.x = CGFloat(i) *  scrollW
            let name = "home_hover" // + "\(i)"
            imageView.image = UIImage.init(named: name)
            scrollview.addSubview(imageView)
           scrollview.contentSize = CGSize.init(width: CGFloat(guideCount) * scrollW, height: 0.0)
            scrollview.bounces = false
            scrollview.isPagingEnabled = true
            scrollview.showsHorizontalScrollIndicator = false
            scrollview.delegate = self
            if i == guideCount - 1  {
                setupLastImageView(imageView: imageView)
            }
            
        }
    }
    private func addProgressPoint(){
        pots.centerX = view.centerX
        pots.y = ScreenHeight - ykmargin(margin: 30.0) - 8.0 - dangerousHeight()
        pots.numberOfPages = guideCount
        view.addSubview(pots)
    }
    private func setupLastImageView(imageView : UIImageView){
        imageView.isUserInteractionEnabled = true
        let startBtn = UIButton.init(title:"开始", fontSize: yksysFont(font: 16.0), textColor: ykColor(rgbValue: 0x333333, alpha: 1.0), action: #selector(startClick), target: self, backImageNormal: nil, backImageHighlighted: nil, backImageDisabled: nil)!
        
       startBtn.centerX = view.centerX
        startBtn.y = pots.y - ykmargin(margin: 40.0)
        imageView.addSubview(startBtn)
        
       
    }
    @objc  private func startClick(){
     UIApplication.shared.keyWindow?.rootViewController = YKTabBarController()
        
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
