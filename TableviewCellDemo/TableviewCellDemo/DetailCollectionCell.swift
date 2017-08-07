//
//  DetailCollectionCell.swift
//  TableviewCellDemo
//
//  Created by 仝兴伟 on 2017/8/1.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//  这个是 自定义tableviewcell中collectionviewcell

import UIKit

class DetailCollectionCell: UITableViewCell {
    
    // 初始化控件
    var img = UIImageView()
    var title = UILabel()
    
    func sendModel(model : ListModel) {
        self.img.sd_setImage(with: URL.init(string: model.img!), placeholderImage: UIImage.init(named: "logo"))
        self.title.text = model.title
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews()  {
        
        // 设置img
        self.img = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 40, height: 40))
        self.img.backgroundColor = UIColor.white
        self.contentView.addSubview(self.img)
        
        self.title = UILabel.init(frame: CGRect.init(x: img.x + img.width + 20, y: 20, width: (UIScreen.main.bounds.size.width - (img.x + img.width + 30)), height: 30))
        self.title.font = UIFont.systemFont(ofSize: 14)
        self.title.textAlignment = .left
        self.contentView.addSubview(self.title)
    }
    
    
}
