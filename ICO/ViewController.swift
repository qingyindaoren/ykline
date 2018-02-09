//
//  ViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

//  let identify =  String(describing: self.classForCoder) //转化为类的字符串名称
//        let vcName = ""//字符串转换为类
//        let cls = NSClassFromString(namespace + "." + vcName) as! UIViewController.Type
//        let vc = cls.init()

class ViewController: YKBaseViewController {

    @objc private func didClickPush(btn: UIButton){
//                let v = Y_StockChartViewController()
//        let v = ViewController()
//        v.view.backgroundColor = ykrandomColor()
//        v.modalTransitionStyle = .crossDissolve
//        self.present(v, animated: true, completion: nil)
        
        
    }
    
    
    private lazy var pushBtn: UIButton = {
        let btn = UIButton(title: "全屏", fontSize: 30.0, textColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
        
        btn.addTarget(self, action: #selector(didClickPush(btn:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       demo1()
     
    }
   
    private func setupUI(){
        view.addSubview(pushBtn)
        pushBtn.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
    }
     func demo1(){
        //例子：
        
     
        let parameters = ["appkey":"11474086",
                          "limit":"24",
                          "city":"北京",
                          "page":"1",
                          "sign":"93AD7448260235FCB3F691EF4CE8B2B12E6C0472"]

        AlamofireMenager.shared.loadData(Path: "v1/deal/find_deals", HTTPMethod: .get, parameters, .query, Success: { (banner: DataModel,netData)  in

        }) { (str) in

        }

 
        

        
       

    }
    
    
    private func demo2(){
        self.isNoEdit = true
        self.showActionSheet()
        
    }
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //获取选择图片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageData:NSData = UIImageJPEGRepresentation(image.scaleImageEquelWH(width: 210.0), 1.0) as! NSData
        sharedDateFormater.dateFormat  = "yyyyMMddHHmmss"
        let fileName: NSString = sharedDateFormater.string(from: NSDate.init() as Date) + ".jpg" as NSString
        dismiss(animated: true, completion: {
            
        })
        //刷新
        //self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func clickRelodData(ykNoNetView:YKNoNetView){
        demo1()
    }

}

