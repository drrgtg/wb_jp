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
    // Text
    var stickerTextView: JPStickerFontView?
    // sticker
    var stickerBGView: JPStickerPictureView?
    var selectSticker: StickerView?
    var simage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Edit"
        // default is clickBtn1
        clickBtn1(btn1 as Any)
        tempBGView?.setupDataUI(selImages?.count ?? 0)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.addImageViews()
        }
        tempModeChanged()
        marginModeChaned()
        fontModeChanged()
        stickerModeChanged()
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
        // sticker
        let stickerBGV = JPStickerPictureView(frame: frame)
        workTabBGView.addSubview(stickerBGV)
        stickerBGV.backgroundColor = backColor
        stickerBGV.isHidden = true
        stickerBGView = stickerBGV
        
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
    func fontModeChanged() {
        fontBGView?.clickFont = {[weak self] (font) in
            // show a textedit in middle
            self?.showTextView(font)
        }
        fontBGView?.clickBGColorBlock = { [weak self] (color) in
            guard let v = self?.stickerTextView else {
                return
            }
            v.textView.textColor = color
        }
    }
    func stickerModeChanged() {
        
        stickerBGView?.clickBGColorBlock = { [weak self] (stickerImage) in
            guard let sself = self, let image = stickerImage else {
                return
            }
            sself.addStickerView(image)
        }
    }
    func addStickerView(_ image: UIImage) {

        let stickerView = StickerView(contentFrame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height), contentImage: image)
        stickerView?.enabledControl = false
        stickerView?.enabledBorder = false
        stickerView?.delegate = self as StickerViewDelegate
        stickerView?.performTapOperation()
        imageContainerView.addSubview(stickerView!)
        stickerView?.center = imageContainerView.center
        selectSticker = stickerView
    }
    func showTextView(_ font: UIFont) {
        if stickerTextView == nil {
            let v = JPStickerFontView(frame: CGRect(x: 0, y: 0, width: 210, height: 70))
            v.backgroundColor = .clear
            v.textView.font = font
            v.textView.text = "Font"
            v.center = imageContainerView.center
            v.textView.sizeToFit()
            v.sizeToFit()
            imageContainerView.addSubview(v)
            stickerTextView = v
        } else {
            stickerTextView?.textView.font = font
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
        stickerBGView?.isHidden = false
        if let tv = stickerBGView {
            workTabBGView.bringSubviewToFront(tv)
        }
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
    }
    @IBAction func clickSaveBtn(_ sender: Any) {
        // use coin to save
        let alert = QMUIAlertController(title: "Save Image", message: "Speed 3000 gold coins to save image", preferredStyle: .alert)
        alert.addAction(QMUIAlertAction(title: "determine", style: .default, handler: { (_, _) in
            print("determine")
            self.payAndSave()
        }))
        alert.addCancelAction()
        alert.showWith(animated: true)
    }
    func payAndSave() {
        simage = saveImage()
        if let saveImage = simage {
            UIImageWriteToSavedPhotosAlbum(saveImage, self, #selector(saveFinished), nil)
        }
    }
    @objc func saveFinished() {
        let vc = JPSaveViewController()
        vc.image = simage
        navigationController?.pushViewController(vc, animated: true)
    }
        
    func saveImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(imageContainerView.frame.size,true, 0.0);
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        imageContainerView.layer.render(in: context)
        let snapShotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapShotImage
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension JPImageEditViewController: StickerViewDelegate {

    func stickerViewDidTapContentView(_ stickerView: StickerView!) {
        if let sticker = selectSticker {
            sticker.enabledControl = false
            sticker.enabledBorder = false
        } else {
            selectSticker = stickerView
            selectSticker?.enabledBorder = true
            selectSticker?.enabledControl = true
        }
    }
    func stickerViewDidTapDeleteControl(_ stickerView: StickerView!) {
        for subView in imageContainerView.subviews {
            if let sv = subView as? StickerView {
                sv.performTapOperation()
                break
            }
        }
    }
}
