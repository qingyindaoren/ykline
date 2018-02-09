//
//  YKKLineViewController.swift
//  ICO
//
//  Created by yunke on 2018/2/1.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit


class YKKLineViewController: YKBaseViewController {
    var isFullScreen: Bool = false
    var addTapBlock: ((_ view:UIView)->())?
    var removeTapBlock: ((_ view:UIView)->())?
    var pragrams:[String:String]?
    //交易所
    //交易对
     lazy var stockChartView:Y_StockChartView = {
 UserDefaults.standard.integer(forKey: "segToneIndexKey")
        
        if  UserDefaults.standard.integer(forKey: "segToneIndexKey") == 0  {
            let   t = Y_StockChartSegmentStartTag + 400 + 3
            UserDefaults.standard.set(t, forKey: "segToneIndexKey")
            UserDefaults.standard.setValue("默认", forKey: "segToneKey")
            UserDefaults.standard.synchronize()
        }
    
        
      let s = Y_StockChartView()
        let defaultKline = (UserDefaults.standard.object(forKey: segkLineKey) as? String) ?? "1分"
        var klineTitles = ["分时","1分","3分","5分","10分","15分","30分","1小时","2小时","4小时","6小时","12小时","1天","3天","1周","1月"]
        klineTitles.insert(defaultKline, at: 0)
       
        var defaultMA = (UserDefaults.standard.object(forKey: segMAKey) as? String) ?? "MA"
        if defaultMA == "关闭"{
          defaultMA = "主指标"
        }
        var mATitles = ["MA","EMA","BOLL","关闭"]
        mATitles.insert(defaultMA, at: 0)
        
        var defaultKDJ = (UserDefaults.standard.object(forKey: segKDJKey) as? String) ?? "KDJ"
        if defaultKDJ == "关闭"{
            defaultKDJ = "指标"
        }
        var kDJTitles = ["MACD","KDJ","关闭"]
        kDJTitles.insert(defaultKDJ, at: 0)
        
        var defaultTone = (UserDefaults.standard.object(forKey: segToneKey) as? String) ?? "色调"
        if defaultTone == "默认" {
            defaultTone = "色调"
        }
        var toneTitles = ["亮色","暗色","默认"]
        toneTitles.insert(defaultTone, at: 0)
        
        
        var fullScreenTitle = ["全屏"]
        if isFullScreen == true {
            fullScreenTitle = ["返回"]
        }
        s.itemModels = [
            Y_StockChartViewItemModel.init(title: klineTitles, type:.kline),
                        Y_StockChartViewItemModel.init(title: mATitles, type:.mainIndex),
                        Y_StockChartViewItemModel.init(title:kDJTitles, type:.index),
                        Y_StockChartViewItemModel.init(title: toneTitles, type:.tone),
                        Y_StockChartViewItemModel.init(title:fullScreenTitle, type:.fullScreen)]
   
        s.dataSource = self
        self.view.addSubview(s)
        s.snp.makeConstraints({ (make) in
            if isFullScreen == true {
                if isIphoneX() {
                  make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, statusHeight(), dangerousHeight(), statusHeight()))
                }else{
                make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
                }
            }else {
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, coinDetailtopViewHeight, 0))
            }
        })
       
       return s
    }()
//    private var currentIndex: NSInteger?
    private var type: String?
    private var groupModel: Y_KLineGroupModel?
    private lazy var modelsDict: [String:Y_KLineGroupModel] = {
       var m = [String:Y_KLineGroupModel]()
        return m
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.isFullScreen == true {
         UIApplication.shared.isStatusBarHidden = true
        }
  
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height:ScreenHeight -  detailSectionHeight - navStatusHeight()-coinDetailtopViewHeight )
//        self.currentIndex = -1
        if isFullScreen == true {
         NotificationCenter.default.addObserver(self, selector: #selector(dismissScreen), name: NSNotification.Name(rawValue: "dismissFullScreen"), object: nil)    
        }else{
              NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "reloadKlineData"), object: nil)
        }
        self.stockChartView.backgroundColor = UIColor.background()
        self.view.backgroundColor = UIColor.background()
    }
 @objc   private func  reloadData(){
        
        let  parameters = ["period":(self.type ?? "1min"),//配置传过来的交易所，交易对
                          "symbol":"btcusdt",
                          "size":"300"
                        ]
        self.pragrams = parameters;

        AlamofireMenager.shared.loadData(Path: "market/history/kline", HTTPMethod: .get, parameters, .query,Success: { (response, netData) in
            
            let dictionary = response as! Dictionary<String, Any>
            
            if let array = (dictionary["data"] as? [Any]) {
              let groupModel = Y_KLineGroupModel.object(with: array)
           self.groupModel = groupModel
                self.modelsDict[self.type!] = groupModel
                self.stockChartView.reloadData()
            }
           
        }) { (str) in
           self.stockChartView.reloadData()
      
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension YKKLineViewController:Y_StockChartViewDataSource{
    internal   func stockDatas(with index: Int) -> Any! {
        var t: String = "1min"
        switch index {
        case 0:
            t = "1min"
            
        case 1:
            t = "1min"
            
        case 2:
            t = "1min"
            
        case 3:
            t = "3min"
            
        case 4:
            t = "5min"
        case 5:
            t = "10min"
        case 6:
            t = "15min"
        case 7:
            t = "30min"
        case 8:
            t = "60min"
        case 9:
            t = "2hour"
        case 10:
            t = "4hour"
        case 11:
            t = "6hour"
        case 12:
            t = "12hour"
        case 13:
            t = "1day"
        case 14:
            t = "3day"
        case 15:
            t = "1week"
        case 16:
            t = "1month"
  
        default:
            break
        }
//        currentIndex = index
        self.type = t
        
        if let model = self.modelsDict[t] {
            //有内存缓存，展示缓存然后加载网络数据
            return model.models
//            self.groupModel = model
//            self.stockChartView.reloadData()
        }else{
            self.reloadData()

        }
        return nil
    }
    internal  func addTapGeogres(with view: UIView!) {
        addTapBlock?(view)
    }
    internal  func removeTapGeogres(with view: UIView!) {
     removeTapBlock?(view)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get{
            if self.isFullScreen {
                return .landscape
            }
            return .portrait
        }
    }
    override var shouldAutorotate: Bool{
        get{
            return false
        }
    }
    @objc func dismissScreen(){
        let appdlegate: AppDelegate =  UIApplication.shared.delegate as! AppDelegate
        appdlegate.isEable = false
        self.dismiss(animated: true) {
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadKlineData"), object: nil)
        }
       
        
    }
}

