//
//  JPCoinListTableViewCell.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPCoinListTableViewCell: QMUITableViewCell {

    @IBOutlet weak var circleBGView: UIView!
    @IBOutlet weak var coinCountLabel: UILabel!
    @IBOutlet weak var payBtn: UIButton!
    var clickPayBlock: (() -> (Void))?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleBGView.layer.cornerRadius = 23
        circleBGView.layer.masksToBounds = true
        circleBGView.layer.borderColor = UIColor.white.cgColor
        circleBGView.layer.borderWidth = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickPayBtn(_ sender: Any) {
        clickPayBlock?()
    }
    
}
