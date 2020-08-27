//
//  JPBackgroundItemView.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPBackgroundItemView: UIView {

    
    var clickBlock: ((Int)->(Void))?
    
    lazy var contentBtn: QMUIButton = {
        let button = QMUIButton(type: .custom)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        backgroundColor = UIColor.qmui_color(withHexString: "#2D2D2D")
        layer.cornerRadius = 3
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews(){
        addSubview(contentBtn)
        contentBtn.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        contentBtn.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
    }
    @objc func clickMe() {
        clickBlock?(contentBtn.tag)
    }
}
