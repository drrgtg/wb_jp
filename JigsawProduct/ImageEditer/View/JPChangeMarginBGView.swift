//
//  JPChangeMarginBGView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPChangeMarginBGView: UIView {
    
    var sliderFillet: QMUISlider?
    var sliderMargin: QMUISlider?
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
        puzzleLabel.text = "Picture fillet"
        puzzleLabel.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel)
        // scroll1
        let slider1 = QMUISlider(frame: CGRect(x: 14, y: puzzleLabel.qmui_bottom, width: puzzleLabel.qmui_width, height: 50))
        slider1.thumbSize = CGSize(width: 14, height: 14)
        slider1.thumbColor = .white
        slider1.minimumTrackTintColor = .white
        slider1.maximumTrackTintColor = UIColor.qmui_color(withHexString: "#2E2E2E")
        self.addSubview(slider1)
        sliderFillet = slider1
        // label2
        let puzzleLabel2 = UILabel(frame: CGRect(x: 14, y: slider1.qmui_bottom, width: self.qmui_width - 28, height: 40))
        puzzleLabel2.text = "Margin width"
        puzzleLabel2.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel2.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel2)
        // scroll2
        let slider2 = QMUISlider(frame: CGRect(x: 14, y: puzzleLabel2.qmui_bottom, width: puzzleLabel.qmui_width, height: 50))
        slider2.thumbSize = CGSize(width: 14, height: 14)
        slider2.thumbColor = .white
        slider2.minimumTrackTintColor = .white
        slider2.maximumTrackTintColor = UIColor.qmui_color(withHexString: "#2E2E2E")
        self.addSubview(slider2)
        sliderMargin = slider2
    }
}
