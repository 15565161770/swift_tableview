//
//  ListModel.swift
//  TableviewCellDemo
//
//  Created by 仝兴伟 on 2017/8/7.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

import UIKit

class ListModel: NSObject {
    var title : String?
    var img : String?
    
    init(dict : [NSString : AnyObject]) {
        super.init()
        setValuesForKeys(dict as [String : AnyObject])
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
