//
//  JPImageEditViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImageEditViewController: JPBaseViewController {

    var selImages: [UIImage]?
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var workTabBGView: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    // template
    var tempBGView: JPTemplateABGView?
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Edit"
        // default is clickBtn1
        clickBtn1(btn1 as Any)
        tempBGView?.setupDataUI(selImages?.count ?? 0)
        tempBGView?.clickTempMode = {[weak self] (modeNum) in
            guard let sself = self else {
                return
            }
            sself.animationMuban(modeNum)
        }
        tempBGView?.clickBGColorBlock = {[weak self] (color) in
            guard let sself = self else {
                return
            }
            sself.imageContainerView.backgroundColor = color
        }
        addImageViews()
    }
    override func initSubviews() {
        super.initSubviews()
        let tempBGV = JPTemplateABGView(frame: CGRect(x: 0, y: 0, width: view.qmui_width, height: 180))
        workTabBGView.addSubview(tempBGV)
        tempBGView = tempBGV
//        let marginBGV = JPChangeMarginBGView()
    }
    func addImageViews(){
        for i in 0..<selImages!.count {
            let imageV = UIImageView()
            imageV.tag = 1000 + i
            imageV.contentMode = .scaleAspectFill
            imageV.clipsToBounds = true
            imageV.contentScaleFactor = UIScreen.main.scale
            imageV.autoresizingMask = .flexibleHeight
            imageV.image = selImages?[i]
            imageContainerView.addSubview(imageV)
        }
        animationMuban(0)
    }
    func animationMuban(_ number: Int){
        for i in 0..<selImages!.count {
            if let rect = (tempBGView?.templateModel?.rectModel?.rectArray[number][i]) as? NSDictionary {
                if let center = rect["center"] as? CGPoint, let size = rect["size"] as? CGSize {
                    let fatherWidth = imageContainerView.qmui_width
                    let imageView = imageContainerView.viewWithTag(1000 + i)
                    UIView.animate(withDuration: 0.25) {
                        imageView?.transform = CGAffineTransform.identity
                        imageView?.frame = CGRect(x: 0, y: 0, width: size.width * fatherWidth, height: size.height * fatherWidth)
                        imageView?.center = CGPoint(x: center.x * fatherWidth, y: center.y * fatherWidth)
                    }
                }
            }
            
        }
    }
    @IBAction func clickBtn1(_ sender: Any) {
        btn1.isSelected = !btn1.isSelected
        tempBGView?.isHidden = false
        if let tv = tempBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    @IBAction func clickBtn2(_ sender: Any) {
        btn2.isSelected = !btn2.isSelected
        tempBGView?.isHidden = false
        if let tv = tempBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn1.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    @IBAction func clickBtn3(_ sender: Any) {
        btn3.isSelected = !btn3.isSelected
        tempBGView?.isHidden = false
        if let tv = tempBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn1.isSelected = false
        btn2.isSelected = false
        btn4.isSelected = false
    }
    @IBAction func clickBtn4(_ sender: Any) {
        btn4.isSelected = !btn4.isSelected
        tempBGView?.isHidden = false
        if let tv = tempBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
    }
    @IBAction func clickSaveBtn(_ sender: Any) {
        
    }
}
