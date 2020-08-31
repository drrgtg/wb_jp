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
            guard let sself = self, let delIndex = sself.imageContainer?.selectPhotosArr.firstIndex(of: selData), let selCellIndex = sself.imageManager?.photosArray.index(of: selData) else {
                return
            }
            
            sself.imageContainer?.selectPhotosArr.remove(at: delIndex)
            let item = IndexPath(item: selCellIndex, section: 0)
            let cell = sself.imageContainer?.collectionView.cellForItem(at: item) as! JPImagePickerItemCollectionViewCell
            cell.isSelected = false
            cell.itemSelectImage.isHidden = true
        }
        selImageContainer?.nextClickBlock = {[weak self] in
            //
            self?.clickNext()
        }
    }
    func clickNext(){

        if imageContainer?.selectPhotosArr.count == 0 {
            JPToast.showToast("Please select at least one photo")
        } else {
            guard let selPhotos = imageContainer?.selectPhotosArr else {
                return
            }
            let queue = DispatchQueue(label: "downloadQueue")
            let group = DispatchGroup()
            var imageArr = [UIImage]()
            for item in selPhotos {
                group.enter()
                let options = PHImageRequestOptions()
                options.resizeMode = .none;
                options.deliveryMode = .highQualityFormat
                PHImageManager.default().requestImage(for: item, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, info) in
                    if let dImage = image  {
                        imageArr.append(dImage)
                    }
                    group.leave()
                }
            }
            group.notify(queue: queue) {
                DispatchQueue.main.sync {
                    let vc = JPImageEditViewController()
                    vc.selImages = imageArr
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
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
