//
//  JPImageEditViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/27.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPImageEditViewController: JPBaseViewController {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var workTabBGView: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // default is clickBtn1
        clickBtn1(btn1 as Any)
    }
    
    @IBAction func clickBtn1(_ sender: Any) {
        btn1.isSelected = !btn1.isSelected
    }
    @IBAction func clickBtn2(_ sender: Any) {
        btn2.isSelected = !btn2.isSelected
    }
    @IBAction func clickBtn3(_ sender: Any) {
        btn3.isSelected = !btn3.isSelected
    }
    @IBAction func clickBtn4(_ sender: Any) {
        btn4.isSelected = !btn4.isSelected
    }
    @IBAction func clickSaveBtn(_ sender: Any) {
        
    }
}
