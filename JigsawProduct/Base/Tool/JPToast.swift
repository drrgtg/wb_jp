//
//  JPToast.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import Foundation

func showToast(_ message:String) {
    
}
func showSuccess(_ message: String) {
    SVProgressHUD.showSuccess(withStatus: message)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
        SVProgressHUD.dismiss()
    }
}
func showLoading(_ message: String) {
    SVProgressHUD.show(withStatus: "")
}
func hidLoading() {
    SVProgressHUD.dismiss()

}
