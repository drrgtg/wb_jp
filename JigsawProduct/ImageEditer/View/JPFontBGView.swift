//
//  JPFontBGView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/28.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPFontBGView: UIView {
    
    var scrollView1: UIScrollView?
    var scrollView2: UIScrollView?
    let fonts: [UIFont?] = [
        UIFont(name: "Thonburi-Bold", size: 15),
        UIFont(name: "KhmerSangamMN", size: 15),
        UIFont(name: "SnellRoundhand-Black", size: 15),
        UIFont(name: "AcademyEngravedLetPlain", size: 15),
        UIFont(name: "MarkerFelt-Thin", size: 15),
        UIFont(name: "Avenir-Heavy", size: 15),
        UIFont(name: "GeezaPro-Bold", size: 15),
        UIFont(name: "ArialRoundedMTBold", size: 15),
        UIFont(name: "Trebuchet-BoldItalic", size: 15),
        UIFont(name: "ArialMT", size: 15),
        UIFont(name: "Marion-Regular", size: 15),
        UIFont(name: "Menlo-Italic", size: 15),
        UIFont(name: "MalayalamSangamMN", size: 15),
        UIFont(name: "KannadaSangamMN", size: 15),
        UIFont(name: "GurmukhiMN-Bold", size: 15),
        UIFont(name: "BodoniSvtyTwoOSITCTT-BookIt", size: 15)]
    let colors: [UIColor?] = JPTemplateColorModel().allColors
    
    var clickFont: ((UIFont) -> (Void))?
    var clickBGColorBlock: ((UIColor) -> (Void))?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubViews() {
        // label
        let puzzleLabel = UILabel(frame: CGRect(x: 14, y: 0, width: self.qmui_width - 28, height: 40))
        puzzleLabel.text = "Font"
        puzzleLabel.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel)
        // scroll1
        let scroll1 = UIScrollView(frame: CGRect(x: 14, y: puzzleLabel.qmui_bottom, width: puzzleLabel.qmui_width, height: 50))
        self.addSubview(scroll1)
        scrollView1 = scroll1
        // label2
        let puzzleLabel2 = UILabel(frame: CGRect(x: 14, y: scroll1.qmui_bottom, width: self.qmui_width - 28, height: 40))
        puzzleLabel2.text = "Color"
        puzzleLabel2.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel2.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel2)
        // scroll2
        let scroll2 = UIScrollView(frame: CGRect(x: 14, y: puzzleLabel2.qmui_bottom, width: puzzleLabel2.qmui_width, height: 50))
        self.addSubview(scroll2)
        scrollView2 = scroll2
        fillSubViews()
    }
    // fillSubViews
    func fillSubViews() {
        for i in 0..<fonts.count {
            let font = fonts[i]
            let x = i * 66
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            scrollView1?.addSubview(tempView)
            tempView.contentBtn.tag = 300 + i
            tempView.contentBtn.setTitle("Font", for: .normal)
            tempView.contentBtn.setTitleColor(.white, for: .normal)
            tempView.contentBtn.setBackgroundImage(UIImage.qmui_image(with: UIColor.qmui_color(withHexString: "#C110D3")), for: .selected)
            tempView.contentBtn.titleLabel?.font = font
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self, let sfont = sself.fonts[i] else {
                    return
                }
                sself.clickSmContentBtn(tag, count: sself.fonts.count)
                sself.clickFont?(sfont)
            }
        }
        scrollView1?.contentSize = CGSize(width: fonts.count * 66, height: 50)
        // backgroundColor
        let bModel = JPTemplateColorModel()
        for i in 0..<colors.count {
            let x = i * 66
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            tempView.contentBtn.tag = 400 + i
            scrollView2?.addSubview(tempView)
            let color = bModel.allColors[i]
            tempView.contentBtn.setBackgroundImage(UIImage.qmui_image(with: color), for: .normal)
            tempView.contentBtn.setImage(UIImage(named: "icon_bg_select"), for: .selected)
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self else {
                    return
                }
                sself.clickBGContentBtn(tag, count: sself.colors.count)
                if let color = bModel.allColors[tag - 400] {
                    sself.clickBGColorBlock?(color)
                }
            }
        }
        scrollView2?.contentSize = CGSize(width: bModel.allColors.count * 66 + 66, height: 50)
    }
    func clickSmContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count {
            let btn = scrollView1?.viewWithTag(300 + i) as! UIButton
            if tag == 300 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
    func clickBGContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count{
            let btn = scrollView2?.viewWithTag(400 + i) as! UIButton
            if tag == 400 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
}
