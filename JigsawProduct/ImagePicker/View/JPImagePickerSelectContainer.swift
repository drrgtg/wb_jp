//
//  JPImagePickerSelectContainer.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImagePickerSelectContainer: UIView {

    private let JPImagePickerSelectCellID = "JPImagePickerSelectCellID"
    private var selDataSource: [PHAsset]?
    var delChangeBlock: ((PHAsset) -> (Void))?

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 15
        let width = 74
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 35, width: self.qmui_width, height: self.qmui_height - 35), collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "JPImagePickerSelectCell", bundle: .main), forCellWithReuseIdentifier: JPImagePickerSelectCellID)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = QMUILabel(frame: CGRect(x: 14, y: 0, width: 250, height: 35))
        label.text = "Choose 1~6 photos to edit"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        addSubview(label)
        let nextBtn = QMUIButton(type: .custom)
        nextBtn.setImage(UIImage(named: "icon_select_next"), for: .normal)
        nextBtn.frame = CGRect(x: self.qmui_width - 80, y: 7, width: 60, height: 24)
        addSubview(nextBtn)
        nextBtn.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func fillData(_ selData: [PHAsset]){
        selDataSource = selData
        collectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func clickNext() {
        
    }
    
        
}
extension JPImagePickerSelectContainer: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selDataSource?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JPImagePickerSelectCellID, for: indexPath) as! JPImagePickerSelectCell
        if let selData = selDataSource?[indexPath.row] {
            //  展示图片
            PHCachingImageManager.default().requestImage(for: selData, targetSize: .zero, contentMode: .aspectFit, options: nil) { (result: UIImage?, dictionry: Dictionary?) in
                if let image = result {
                    cell.bgImageView.image = image
                }
            }

            cell.deleteBlock = {[weak self] in
                self?.selDataSource?.remove(at: indexPath.row)
                self?.collectionView.reloadData()
                self?.delChangeBlock?(selData)
            }
        }
        return cell
    }
}
