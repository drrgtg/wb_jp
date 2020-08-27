//
//  JPImagePickerSelectCell.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImagePickerSelectCell: UICollectionViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var deleteBtn: UIButton!
    var deleteBlock: (() -> (Void))?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func clickDelete(_ sender: Any) {
        deleteBlock?()
    }
}
