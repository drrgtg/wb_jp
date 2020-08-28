//
//  JPMainViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit
import SnapKit
class JPMainViewController: JPBaseViewController {

    private var coinBtn: QMUIButton?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func preferredNavigationBarHidden() -> Bool {
        return true
    }
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }
    override func initSubviews() {
        super.initSubviews()
        // BG
        let homeBGImage = UIImage(named: "icon_home_bg")
        var bgHeight: CGFloat = 206.0
        if let size = homeBGImage?.size {
            let height = view.qmui_width / size.width * size.height
            if height + 206 > view.qmui_height {
                bgHeight = view.qmui_height - 206
            } else {
                bgHeight = height
            }
        }
        let bgImageView = UIImageView()
        bgImageView.image = homeBGImage
        bgImageView.contentMode = .scaleAspectFill
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(bgHeight)
        }
        
        // bottom BG
        let bottomBG = UIView()
        bottomBG.backgroundColor = .black
        view.addSubview(bottomBG)
        bottomBG.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bgImageView.snp.bottom)
        }
        
        // middle button
        let middleBtn = UIButton(type: .system)
        bottomBG.addSubview(middleBtn)
        middleBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(37)
            make.centerX.equalToSuperview()
        }
        middleBtn.sizeToFit()
        middleBtn.setBackgroundImage(UIImage(named: "icon_home_start"), for: .normal)
        middleBtn.addTarget(self, action: #selector(middleClicked), for: .touchUpInside)
        
        // left button
        let leftBtn = QMUIButton(type: .custom)
        bottomBG.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.top.equalTo(middleBtn.snp.bottom).offset(20)
            make.leading.equalTo(middleBtn).offset(-10)
            make.width.height.equalTo(50)
        }
        leftBtn.setImage(UIImage(named: "icon_home_setting"), for: .normal)
        leftBtn.addTarget(self, action: #selector(settingClicked), for: .touchUpInside)
        
        // right button
        let rightBtn = QMUIButton(type: .custom)
        bottomBG.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(leftBtn)
            make.trailing.equalTo(middleBtn)
            make.height.equalTo(50)
        }
        rightBtn.setTitleColor(.white, for: .normal)
        rightBtn.setImage(UIImage(named: "icon_home_gold"), for: .normal)
        rightBtn.setTitle("", for: .normal)
        rightBtn.spacingBetweenImageAndTitle =  8
        rightBtn.addTarget(self, action: #selector(coinClicked), for: .touchUpInside)
        coinBtn = rightBtn
    }
    
    @objc func middleClicked() {
        // request auth
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    DispatchQueue.main.async {
                        self.showImagePickerVC()
                    }
                } else if status == .denied || status == .restricted{
                    showToast("You have declined. Please turn on camera permission in settings")
                }
            })
        } else if PHPhotoLibrary.authorizationStatus() == .authorized {
            showImagePickerVC()
        } else {
            showToast("No access, please turn on camera permission in settings")
        }
    }
    func showImagePickerVC() {
        let vc = JPImagePickerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func settingClicked(){
        let vc = JPSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func coinClicked(){
        let vc = JPCoinListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
