//
//  ViewController.swift
//  ICO
//
//  Created by yunke on 2018/1/23.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit


class ViewController: YKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
   demo1()

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

