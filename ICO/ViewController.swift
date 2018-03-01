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

class ViewController: YKBaseViewController,TOCropViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    private lazy var iconImageView:UIImageView = {
        let icon = UIImageView()
       
        
        return icon
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
//       demo1()
        demo2()

     
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
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100)
        })
        self.iconImageView.layer.cornerRadius = 50.0
        self.iconImageView.layer.masksToBounds = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showActionSheet)))
        
    }
    @objc  private func showActionSheet() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let addCameraAction = UIAlertAction(title: "拍照", style: .default) { [weak self] (action) in
            
            self?.useCamera()
            
            
            
            
        }
        let addPhotoAction = UIAlertAction(title: "从相册选择", style: .default) {[weak self] (action) in
            
            self?.usePhoto()
            print("调起")
            
            
            
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        actionSheet.addAction(addCameraAction)
        actionSheet.addAction(addPhotoAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    private func useCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camera = PureCamera()
            camera.fininshcapture = { (image) in
                //裁剪后的图片用于上传
               self.iconImageView.image = image
            }
            DispatchQueue.main.async {
                self.present(camera, animated: true, completion: nil)
            }
            
        }else {
            print("相机调用失败")
        }
    }
    private func usePhoto(){
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = false
        photoPicker.sourceType = .photoLibrary
        photoPicker.modalTransitionStyle = .coverVertical
        DispatchQueue.main.async {
            self.present(photoPicker, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let cropController = TOCropViewController(image:info[UIImagePickerControllerOriginalImage] as! UIImage )
        cropController?.delegate = self
        var topRoot = UIApplication.shared.keyWindow?.rootViewController
        while ((topRoot?.presentedViewController) != nil) {
            topRoot = topRoot?.presentedViewController
        }
        
        topRoot?.present(cropController!, animated: true, completion: nil)
    }
    func cropViewController(_ cropViewController: TOCropViewController!, didCropTo image: UIImage!, with cropRect: CGRect, angle: Int) {
        //裁剪后的图片用于上传
        self.iconImageView.image = image
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        let viewFrame = self.view.convert(self.iconImageView.frame, to: self.navigationController?.view)
        cropViewController.dismissAnimated(fromParentViewController: self, withCroppedImage: image, toFrame: viewFrame){
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker .dismiss(animated: true, completion: nil)
    }
//     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        //获取选择图片
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let imageData:NSData = UIImageJPEGRepresentation(image.scaleImageEquelWH(width: 210.0), 1.0) as! NSData
//        sharedDateFormater.dateFormat  = "yyyyMMddHHmmss"
//        let fileName: NSString = sharedDateFormater.string(from: NSDate.init() as Date) + ".jpg" as NSString
//        dismiss(animated: true, completion: {
//
//        })
//        //刷新
//        //self.collectionView?.reloadData()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //协议调用断网重连拉数据
    func clickRelodData(ykNoNetView:YKNoNetView){
        demo1()
    }

}

