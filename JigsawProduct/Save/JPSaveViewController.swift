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
        if let iconShare =  UIImage(named: "icon_share"){
            navigationItem.rightBarButtonItem = UIBarButtonItem.qmui_item(with:  iconShare, target: self, action: #selector(shareClicked))
        }
    }
    @objc func shareClicked() {
        //初始化一个UIActivity
        guard let sImage = image else {
            return
        }
        let activityItems = NSMutableArray(array: [sImage])
        //初始化UIActivityViewController
        let activityController = UIActivityViewController(activityItems: activityItems as! [Any], applicationActivities: nil)
        //iphone中为模式跳转
        present(activityController, animated: true, completion: nil)
    }
}
