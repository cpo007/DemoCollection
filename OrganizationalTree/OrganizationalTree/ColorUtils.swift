//
//  ColorUtils.swift
//  OrganizationalTree
//
//  Created by cpo007@qq.com on 2019/8/1.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import UIKit

struct ColorUtils {
    
    static func randomColor() -> UIColor {
        return UIColor.init(red: CGFloat(arc4random() % 255) / 255, green: CGFloat(arc4random() % 255) / 255, blue: CGFloat(arc4random() % 255) / 255, alpha: 1)
    }

}
