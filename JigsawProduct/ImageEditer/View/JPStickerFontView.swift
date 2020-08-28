//
//  JPStickerFontView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/28.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPStickerFontView: UIView {

    lazy var textView: QMUITextView = {
        let textView = QMUITextView()
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.isScrollEnabled = false
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        self.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
