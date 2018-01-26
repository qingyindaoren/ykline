//
//  YKNoNetView.swift
//  ICO
//
//  Created by yunke on 2018/1/25.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit
@objc protocol reloadDelegate:NSObjectProtocol{
    @objc optional func clickRelodData(ykNoNetView : YKNoNetView)
}
class YKNoNetView: UIView {
     weak var noNetdelegate: reloadDelegate?
    lazy var showImageView:UIImageView = {
        let image = UIImageView(image: UIImage.init(named: "home_hover"))
        return image
    }()
    @objc private func reloadData(){
      print("重新加载")
        noNetdelegate?.clickRelodData?(ykNoNetView:self)
    }
    private func setupUI(){
       self.addSubview(showImageView)
        showImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-100.0)
            make.width.equalTo(ScreenWidth*0.4)
            make.height.equalTo(ScreenWidth*0.4)
           
        }
        showImageView.contentMode = .scaleAspectFit
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      setupUI()
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(reloadData))
        self.addGestureRecognizer(tap)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
