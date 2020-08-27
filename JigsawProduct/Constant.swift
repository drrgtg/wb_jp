//
//  Constant.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import Foundation



let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

var iPhoneX: Bool {
    if #available(iOS 11.0, *) {
        return Int(UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > 0
    } else {
        // Fallback on earlier versions
        return false
    }
}
let JPBottomXMAXHeight:CGFloat = iPhoneX ? 34 : 0
