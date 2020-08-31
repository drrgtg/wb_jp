//
//  JPImagePickerContainer.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImagePickerContainer: UIView {
    private var photosArray = PHFetchResult<PHAsset>()
    private let JPImagePickerItemCollectionViewCellID   = "JPImagePickerItemCollectionViewCellID"
    var selectPhotosArr = [PHAsset]()
    var selChangeBlock: (() -> (Void))?
    var maxCount = 6
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        let width = (ScreenWidth - 24) / 3
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "JPImagePickerItemCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: JPImagePickerItemCollectionViewCellID)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func fillImageData(_ photoArr: PHFetchResult<PHAsset>){
        photosArray = photoArr
        collectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JPImagePickerContainer: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JPImagePickerItemCollectionViewCellID, for: indexPath) as! JPImagePickerItemCollectionViewCell
        //  展示图片
        PHCachingImageManager.default().requestImage(for: photosArray[indexPath.row], targetSize: .zero, contentMode: .aspectFit, options: nil) { (result: UIImage?, dictionry: Dictionary?) in
            if let image = result {
                cell.itemImageView.image = image
            }
        }
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if selectPhotosArr.count < 7 {
            let cell = collectionView.cellForItem(at: indexPath) as! JPImagePickerItemCollectionViewCell
            cell.itemSelectImage.isHidden = !cell.itemSelectImage.isHidden
            let selItem = photosArray[indexPath.row]
            if !cell.itemSelectImage.isHidden {
                selectPhotosArr.append(selItem)
            } else {
                selectPhotosArr.removeAll { (item) -> Bool in
                    item == selItem
                }
            }
            selChangeBlock?()
        } else {
            JPToast.showToast("max number is 6", view: self)
        }
    }
    
}
