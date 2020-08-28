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
    var label1: UILabel?
    var label2: UILabel?
    var slideFilletBlock: ((Float)->(Void))?
    var slideMarginBlock: ((Float)->(Void))?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func resetValue() {
        label1?.text = "0%"
        label2?.text = "0%"
        sliderFillet?.value = 0
        sliderMargin?.value = 0
    }
    func setupSubViews(){
        // label
        let puzzleLabel = UILabel(frame: CGRect(x: 14, y: 0, width: self.qmui_width - 28, height: 40))
        puzzleLabel.text = "Picture fillet"
        puzzleLabel.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel)
        // floatValue
        let valueLabel = UILabel(frame: CGRect(x: self.qmui_width - 100, y: 20, width: 100, height: 30))
        valueLabel.text = "0%"
        valueLabel.textColor = UIColor.qmui_color(withHexString: "#B4B4B4")
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        label1 = valueLabel
        self.addSubview(valueLabel)
        // image
        let sImageV1 = UIImageView(image: UIImage(named: "icon_margin"))
        sImageV1.frame = CGRect(x: 14, y: puzzleLabel.qmui_bottom + 15, width: 26, height: 26)
        self.addSubview(sImageV1)

        // slider1
        let slider1 = QMUISlider(frame: CGRect(x: sImageV1.qmui_right + 16, y: puzzleLabel.qmui_bottom + 15, width: self.qmui_width - 84 , height: 26))
        slider1.thumbSize = CGSize(width: 14, height: 14)
        slider1.thumbColor = .white
        slider1.minimumTrackTintColor = .white
        slider1.maximumTrackTintColor = UIColor.qmui_color(withHexString: "#2E2E2E")
        slider1.addTarget(self, action: #selector(slider1ValueChanged(_:)), for: .valueChanged)
        self.addSubview(slider1)
        sliderFillet = slider1
        // label2
        let puzzleLabel2 = UILabel(frame: CGRect(x: 14, y: slider1.qmui_bottom, width: self.qmui_width - 28, height: 40))
        puzzleLabel2.text = "Margin width"
        puzzleLabel2.textColor = UIColor.qmui_color(withHexString: "#5A5A5A")
        puzzleLabel2.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(puzzleLabel2)
        // floatValue
        let valueLabel2 = UILabel(frame: CGRect(x: self.qmui_width - 100, y: puzzleLabel2.qmui_top + 20, width: 100, height: 30))
        valueLabel2.text = "0%"
        valueLabel2.textColor = UIColor.qmui_color(withHexString: "#B4B4B4")
        valueLabel2.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(valueLabel2)
        label2 = valueLabel2
        // image
        let sImageV2 = UIImageView(image: UIImage(named: "icon_circle"))
        sImageV2.frame = CGRect(x: 14, y: puzzleLabel2.qmui_bottom + 15, width: 26, height: 26)
        self.addSubview(sImageV2)

        // slider2
        let slider2 = QMUISlider(frame: CGRect(x: sImageV2.qmui_right + 16, y: puzzleLabel2.qmui_bottom + 15, width: self.qmui_width - 84 , height: 26))
        slider2.thumbSize = CGSize(width: 14, height: 14)
        slider2.thumbColor = .white
        slider2.minimumTrackTintColor = .white
        slider2.maximumTrackTintColor = UIColor.qmui_color(withHexString: "#2E2E2E")
        slider2.addTarget(self, action: #selector(slider2ValueChanged(_:)), for: .valueChanged)
        self.addSubview(slider2)
        sliderMargin = slider2
    }
    @objc func slider1ValueChanged(_ slider: QMUISlider) {
        slideMarginBlock?(slider.value)
        label1?.text = "\(Int(slider.value * 100))%"
    }
    @objc func slider2ValueChanged(_ slider: QMUISlider) {
        slideFilletBlock?(slider.value)
        label2?.text = "\(Int(slider.value * 100))%"
    }
}
