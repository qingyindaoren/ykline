//
//  YKNewsTableViewCell.swift
//  ICO
//
//  Created by yunke on 2018/2/26.
//  Copyright © 2018年 yunke. All rights reserved.
//

import UIKit

class YKNewsTableViewCell: UITableViewCell {
    private lazy var  imageIcon:UIImageView = {
        let image = UIImageView(image: UIImage.init(named: "home_hover"))
       
        return image
    }()
    private lazy var newsTitle:UILabel = {
        let l = UILabel(title: "赶紧买，买就赚", fontSize: 30.0, textColor: ykColor(rgbValue: 0x333333))
        l.numberOfLines = 2
        return l
    }()
    private lazy var newsDate:UILabel = {
        let l = UILabel(title: "2018-01-22 11:25:20", fontSize: 26.0, textColor: ykColor(rgbValue: 0x333333))
        return l
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageIcon)
        contentView.addSubview(newsTitle)
        contentView.addSubview(newsDate)
        // Initialization code
        imageIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(contentView).offset(15.0)
            make.bottom.equalTo(contentView).offset(-15.0)
            make.width.equalTo(125.0 * scale)
        }
        newsTitle.snp.makeConstraints { (make) in
            make.left.equalTo(imageIcon.snp.right).offset(15.0)
            make.top.equalTo(imageIcon)
        }
        newsDate.snp.makeConstraints { (make) in
            make.right.equalTo(contentView).offset(-15.0)
            make.bottom.equalTo(contentView).offset(-15.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
