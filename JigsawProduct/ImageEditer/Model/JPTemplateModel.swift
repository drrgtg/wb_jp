//
//  JPTemplateModel.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit
// template Mode
class JPTemplateModel: NSObject {
    private var imageCount:Int = 0
    var images:[UIImage] = []
    var selImages: [UIImage] = []
    var rectModel: FFStyleModel?
    init(_ count: Int) {
        super.init()
        self.imageCount = count
        setupModel()
    }
    func setupModel(){
        let rtModel = FFStyleModel(imageCount: imageCount)
        rectModel = rtModel
        switch imageCount {
        case 1:
            let imageNames = ["icon_nomal_1-1","icon_nomal_1-2","icon_nomal_1-3","icon_nomal_1-4","icon_nomal_1-5","icon_nomal_1-6","icon_nomal_1-7"]
            let selImageNames = ["icon_sel_1-1","icon_sel_1-2","icon_sel_1-3","icon_sel_1-4","icon_sel_1-5","icon_sel_1-6","icon_sel_1-7"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }
        case 2:
            let imageNames = ["icon_nomal_2-1","icon_nomal_2-2","icon_nomal_2-3","icon_nomal_2-4","icon_nomal_2-5","icon_nomal_2-6","icon_nomal_2-7","icon_nomal_2-8","icon_nomal_2-9","icon_nomal_2-10"]
            let selImageNames = ["icon_sel_2-1","icon_sel_2-2","icon_sel_2-3","icon_sel_2-4","icon_sel_2-5","icon_sel_2-6","icon_sel_2-7","icon_sel_2-8","icon_sel_2-9","icon_sel_2-10"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }

        case 3:
            let imageNames = ["icon_nomal_3-1","icon_nomal_3-2","icon_nomal_3-3","icon_nomal_3-4","icon_nomal_3-5","icon_nomal_3-6","icon_nomal_3-7","icon_nomal_3-8","icon_nomal_3-9","icon_nomal_3-10"]
            let selImageNames = ["icon_sel_3-1","icon_sel_3-2","icon_sel_3-3","icon_sel_3-4","icon_sel_3-5","icon_sel_3-6","icon_sel_3-7","icon_sel_3-8","icon_sel_3-9","icon_sel_3-10"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }
        case 4:
            let imageNames = ["icon_nomal_4-1","icon_nomal_4-2","icon_nomal_4-3","icon_nomal_4-4","icon_nomal_4-5","icon_nomal_4-6","icon_nomal_4-7","icon_nomal_4-8","icon_nomal_4-9","icon_nomal_4-10"]
            let selImageNames = ["icon_sel_4-1","icon_sel_4-2","icon_sel_4-3","icon_sel_4-4","icon_sel_4-5","icon_sel_4-6","icon_sel_4-7","icon_sel_4-8","icon_sel_4-9","icon_sel_4-10"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }
        case 5:
            let imageNames = ["icon_nomal_5-1","icon_nomal_5-2","icon_nomal_5-3","icon_nomal_5-4","icon_nomal_5-5","icon_nomal_5-6","icon_nomal_5-7","icon_nomal_5-8","icon_nomal_5-9","icon_nomal_5-10"]
            let selImageNames = ["icon_sel_5-1","icon_sel_5-2","icon_sel_5-3","icon_sel_5-4","icon_sel_5-5","icon_sel_5-6","icon_sel_5-7","icon_sel_5-8","icon_sel_5-9","icon_sel_5-10"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }
        case 6:
            let imageNames = ["icon_nomal_6-1","icon_nomal_6-2","icon_nomal_6-3","icon_nomal_6-4","icon_nomal_6-5","icon_nomal_6-6","icon_nomal_6-7","icon_nomal_6-8","icon_nomal_6-9","icon_nomal_6-10"]
            let selImageNames = ["icon_sel_6-1","icon_sel_6-2","icon_sel_6-3","icon_sel_6-4","icon_sel_6-5","icon_sel_6-6","icon_sel_6-7","icon_sel_6-8","icon_sel_6-9","icon_sel_6-10"]
            for i in 0..<imageNames.count {
                if let image = UIImage(named: imageNames[i]), let selImage = UIImage(named: selImageNames[i]) {
                    images.append(image)
                    selImages.append(selImage)
                }
            }
        default:
            break
        }
    }
    
}
