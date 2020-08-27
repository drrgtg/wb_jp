//
//  JPTemplateABGView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPTemplateABGView: UIView {

    var scrollView1: UIScrollView?
    var scrollView2: UIScrollView?
    var clickTempMode: ((Int) -> (Void))?
    var clickBGColorBlock: ((UIColor) -> (Void))?
    var templateModel: JPTemplateModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubViews(){
        // label
        let puzzleLabel = UILabel(frame: CGRect(x: 14, y: 0, width: self.qmui_width - 28, height: 40))
        puzzleLabel.text = "Puzzle Template"
        puzzleLabel.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel)
        // scroll1
        let scroll1 = UIScrollView(frame: CGRect(x: 14, y: puzzleLabel.qmui_bottom, width: puzzleLabel.qmui_width, height: 50))
        self.addSubview(scroll1)
        scrollView1 = scroll1
        // label2
        let puzzleLabel2 = UILabel(frame: CGRect(x: 14, y: scroll1.qmui_bottom, width: self.qmui_width - 28, height: 40))
        puzzleLabel2.text = "Background Color"
        puzzleLabel2.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel2.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel2)
        // scroll2
        let scroll2 = UIScrollView(frame: CGRect(x: 14, y: puzzleLabel2.qmui_bottom, width: puzzleLabel2.qmui_width, height: 50))
        self.addSubview(scroll2)
        scrollView2 = scroll2
    }
    func setupDataUI(_ count: Int){
        // 123456
        let model = JPTemplateModel(count)
        templateModel = model
        for i in 0..<model.images.count {
            let x = i * 66
            let normalImage = model.images[i]
            let selImage = model.selImages[i]
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            scrollView1?.addSubview(tempView)
            tempView.contentBtn.tag = 100 + i
            tempView.contentBtn.setImage( normalImage , for: .normal)
            tempView.contentBtn.setImage( selImage , for: .selected)
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self else {
                    return
                }
                sself.clickSmContentBtn(tag, count: model.images.count)
                sself.clickTempMode?(tag - 100)
            }
        }
        scrollView1?.contentSize = CGSize(width: count * 66, height: 50)
        // backgroundColor
        let bModel = JPTemplateColorModel()
        for i in 0..<bModel.allColors.count + 1 {
            let x = i * 66
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            tempView.contentBtn.tag = 200 + i
            scrollView2?.addSubview(tempView)
            if i > 0 {
                let color = bModel.allColors[i - 1]
                tempView.contentBtn.setBackgroundImage(UIImage.qmui_image(with: color), for: .normal)
            } else {
                tempView.contentBtn.setImage(UIImage(named: "icon_bg_none"), for: .normal)
            }
            tempView.contentBtn.setImage(UIImage(named: "icon_bg_select"), for: .selected)
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self else {
                    return
                }
                sself.clickBGContentBtn(tag, count: bModel.allColors.count)
                if tag > 200, let color = bModel.allColors[tag - 200 - 1] {
                    sself.clickBGColorBlock?(color)
                } else {
                    sself.clickBGColorBlock?(.white)
                }
            }
        }
        scrollView2?.contentSize = CGSize(width: bModel.allColors.count * 66 + 66, height: 50)
    }
    func clickSmContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count {
            let btn = scrollView1?.viewWithTag(100 + i) as! UIButton
            if tag == 100 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
    func clickBGContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count + 1 {
            let btn = scrollView2?.viewWithTag(200 + i) as! UIButton
            if tag == 200 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
}
