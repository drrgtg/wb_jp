//
//  JPStickerPictureView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/28.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPStickerPictureView: UIView {
    var scrollView1: UIScrollView?
    var scrollView2: UIScrollView?
    var clickBGColorBlock: ((UIImage?) -> (Void))?

    // 1 - 29
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        // label
        let puzzleLabel = UILabel(frame: CGRect(x: 14, y: 0, width: self.qmui_width - 28, height: 40))
        puzzleLabel.text = "Stickers"
        puzzleLabel.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel)
        // scroll1
        let scroll1 = UIScrollView(frame: CGRect(x: 14, y: puzzleLabel.qmui_bottom + 20, width: puzzleLabel.qmui_width, height: 50))
        self.addSubview(scroll1)
        scrollView1 = scroll1
        // scroll2
        let scroll2 = UIScrollView(frame: CGRect(x: 14, y: scroll1.qmui_bottom + 20, width: scroll1.qmui_width, height: 50))
        self.addSubview(scroll2)
        scrollView2 = scroll2
        fillSubViews()
    }
    
    // fillSubViews
    func fillSubViews() {
        for i in 0..<14 {
            let imageName = "icon_watermark_\(i + 1)"
            let image = UIImage(named: imageName)
            let x = i * 66
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            scrollView1?.addSubview(tempView)
            tempView.contentBtn.tag = 500 + i
            tempView.contentBtn.setBackgroundImage(image, for: .normal)
            tempView.contentBtn.setImage(UIImage(named: "icon_paper_select"), for: .selected)
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self else {
                    return
                }
                sself.clickSmContentBtn(tag, count: 14)
                sself.clickBGColorBlock?(image)
            }
        }
        scrollView1?.contentSize = CGSize(width: 14 * 66 + 66, height: 50)
        // backgroundColor
        for i in 0..<14 {
            let imageName = "icon_watermark_\(i + 1)"
            let image = UIImage(named: imageName)

            let x = i * 66
            let tempView = JPTemplateItemView(frame: CGRect(x: x, y: 0, width: 50, height: 50))
            tempView.contentBtn.tag = 600 + i
            scrollView2?.addSubview(tempView)
            tempView.contentBtn.setBackgroundImage(image, for: .normal)
            tempView.contentBtn.setImage(UIImage(named: "icon_paper_select"), for: .selected)
            tempView.clickBlock = {[weak self] (tag) in
                guard let sself = self else {
                    return
                }
                sself.clickBGContentBtn(tag, count: 14)
                sself.clickBGColorBlock?(image)
            }
        }
        scrollView2?.contentSize = CGSize(width: 14 * 66 + 66, height: 50)
    }
    func clickSmContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count {
            let btn = scrollView1?.viewWithTag(500 + i) as! UIButton
            if tag == 500 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
    func clickBGContentBtn(_ tag: Int, count: Int) {
        for i in 0..<count{
            let btn = scrollView2?.viewWithTag(600 + i) as! UIButton
            if tag == 600 + i {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
}
