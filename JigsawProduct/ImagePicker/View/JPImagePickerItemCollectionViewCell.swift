//
//  JPImagePickerItemCollectionViewCell.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImagePickerItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemSelectImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemSelectImage.isHidden = true
    }
    
}
