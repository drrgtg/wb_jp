//
//  JPImagePickerViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImagePickerViewController: JPBaseViewController {
    private var imageManager: JPImagePickerManager?
    private var imageContainer: JPImagePickerContainer?
    private var selImageContainer: JPImagePickerSelectContainer?
    override func preferredNavigationBarHidden() -> Bool {
        return false
    }
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Select Image"
        let man = JPImagePickerManager()
        man.catchAllPhotoInLibary()
        imageManager = man
        imageContainer?.fillImageData(man.photosArray)
        imageContainer?.selChangeBlock = {[weak self] in
            guard let sself = self, let selPhonotsArr = sself.imageContainer?.selectPhotosArr else {
                return
            }
            sself.selImageContainer?.fillData(selPhonotsArr)
        }
        selImageContainer?.delChangeBlock = {[weak self] (selData) in
            guard let sself = self, let delIndex = sself.imageManager?.photosArray.index(of: selData) else {
                return
            }
            
            let item = IndexPath(item: delIndex, section: 0)
            sself.imageContainer?.selectPhotosArr.removeAll(where: { (obj) -> Bool in
                obj == selData
            })
            let cell = sself.imageContainer?.collectionView.cellForItem(at: item) as! JPImagePickerItemCollectionViewCell
            cell.isSelected = false
            cell.itemSelectImage.isHidden = true
        }
    }
    override func initSubviews() {
        super.initSubviews()
        let container = JPImagePickerContainer(frame: CGRect(x: 0, y: 0, width: view.qmui_width, height: view.qmui_height - 140 - JPBottomXMAXHeight))
        imageContainer = container
        view.addSubview(container)
        let bottomContainer = JPImagePickerSelectContainer(frame: CGRect(x: 0, y: container.qmui_height, width: view.qmui_width, height: 140 + JPBottomXMAXHeight))
        selImageContainer = bottomContainer
        view.addSubview(bottomContainer)
    }
}
