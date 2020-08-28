//
//  JPSaveViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/28.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPSaveViewController: JPBaseViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var contentImageView: UIImageView!
    var image: UIImage?
    
    override func navigationBarBackgroundImage() -> UIImage? {
        UIImage.qmui_image(with: .clear)
    }
    override func navigationBarStyle() -> UIBarStyle {
        .blackOpaque
    }
    override func navigationBarBarTintColor() -> UIColor? {
        .clear
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Share"
        bgImageView.image = image
        contentImageView.image = image
    }
}
