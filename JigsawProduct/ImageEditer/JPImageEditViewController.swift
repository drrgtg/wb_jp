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
    // margin
    var marginBGView: JPChangeMarginBGView?
    // Font
    var fontBGView: JPFontBGView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Edit"
        // default is clickBtn1
        clickBtn1(btn1 as Any)
        tempBGView?.setupDataUI(selImages?.count ?? 0)
        addImageViews()
        tempModeChanged()
        marginModeChaned()
    }
    override func initSubviews() {
        super.initSubviews()
        let frame = CGRect(x: 0, y: 0, width: view.qmui_width, height: 180)
        imageContainerView.layer.masksToBounds = true
        let backColor = workTabBGView.superview?.backgroundColor
        let tempBGV = JPTemplateABGView(frame: frame)
        workTabBGView.addSubview(tempBGV)
        tempBGV.isHidden = true
        tempBGV.backgroundColor = backColor

        tempBGView = tempBGV
        let marginBGV = JPChangeMarginBGView(frame:  frame)
        workTabBGView.addSubview(marginBGV)
        marginBGV.backgroundColor = backColor
        marginBGV.isHidden = true
        marginBGView = marginBGV
        // Font
        let fontBGV = JPFontBGView(frame: frame)
        workTabBGView.addSubview(fontBGV)
        fontBGV.backgroundColor = backColor
        fontBGV.isHidden = true
        fontBGView = fontBGV
        
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
    func tempModeChanged() {
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
    }
    func marginModeChaned() {
        marginBGView?.slideFilletBlock = {[weak self] (value) in
            self?.radiosImageViews(value)
        }
        marginBGView?.slideMarginBlock = {[weak self] (value) in
            print(value)
            self?.animationMargin(value)
        }
    }
    func radiosImageViews(_ precent: Float) {
        for i in 0..<selImages!.count {
            if let imageView = imageContainerView.viewWithTag(1000 + i) {
                imageView.layer.cornerRadius = imageView.qmui_width / 2 * CGFloat(precent)
            }
        }
    }
    func animationMargin(_ precent: Float) {
        for i in 0..<selImages!.count {
            let imageView = imageContainerView.viewWithTag(1000 + i)
            imageView?.transform = CGAffineTransform(scaleX: CGFloat(0.5 * precent) + 1, y: CGFloat(0.5 * precent) + 1)
        }
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
        marginBGView?.isHidden = false
        if let tv = marginBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn1.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
    }
    @IBAction func clickBtn3(_ sender: Any) {
        btn3.isSelected = !btn3.isSelected
        fontBGView?.isHidden = false
        if let tv = fontBGView {
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
