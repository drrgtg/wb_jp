//
//  JPImagePickerManager.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import Foundation
import Photos

class JPImagePickerManager: NSObject, PHPhotoLibraryChangeObserver {
    //  数据源
    var photosArray = PHFetchResult<PHAsset>()
    
    func catchAllPhotoInLibary() {
        
        // 注册通知
        PHPhotoLibrary.shared().register(self)
        // 获取所有系统图片信息集合
        let allOptions = PHFetchOptions()
        // 按照时间排序
        allOptions.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: true)]
        //  将元素集合拆解开，此时 allResults 内部是一个个的PHAsset单元
        photosArray = PHAsset.fetchAssets(with: allOptions)
        // 过滤掉不需要的图片
    }
    // 第一次获取相册信息，这个方法只会进入一次
    func photoLibraryDidChange(_ changeInstance: PHChange) {
           catchAllPhotoInLibary()
     }
}
