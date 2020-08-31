//
//  JPCoinListViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPProductItem: NSObject {
    var price: String = ""
    var goldNumber: String = ""
    var iapID: String = ""
    var desc: String = ""
    init(_ price: String, goldNumber: String, iapID: String, desc: String) {
        super.init()
        self.price = price
        self.goldNumber = goldNumber
        self.iapID = iapID
        self.desc = desc
    }
}
class JPCoinListViewController: JPBaseTableViewController {

    private let JPCoinCellID = "JPCoinListTableViewCellID"
    private var coinBtn: QMUIButton?
    private let dataSource: Array = [
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000"),
        JPProductItem("$0.99", goldNumber: "1000", iapID: "com.jigsaw.slide.000", desc: "X 1000")
    ]
    override func preferredNavigationBarHidden() -> Bool {
        return false
    }
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Coins"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let goldNumber = UserDefaults.standard.string(forKey: kIAPDefaultGoldNumber) {
            coinBtn?.setTitle(goldNumber, for: .normal)
            coinBtn?.sizeToFit()
        }
    }
    override func initSubviews() {
        super.initSubviews()
        // rightBar
        let rightBtn = QMUIButton(type: .custom)
        rightBtn.setImage(UIImage(named: "icon_gold_small"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        rightBtn.setTitle("", for: .normal)
        rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        rightBtn.setTitleColor(.white, for: .normal)
        rightBtn.spacingBetweenImageAndTitle = 6
        rightBtn.sizeToFit()
        coinBtn = rightBtn
        tableView.register(UINib(nibName: "JPCoinListTableViewCell", bundle: .main), forCellReuseIdentifier: JPCoinCellID)
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JPCoinCellID, for: indexPath) as! JPCoinListTableViewCell
        let product = dataSource[indexPath.row]
        cell.coinCountLabel.text = product.desc
        cell.payBtn.setTitle(product.price, for: .normal)
        cell.clickPayBlock = {[weak self] in
            self?.payAtIndex(indexPath.row)
        }
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // Param MARK: private method
    private func payAtIndex(_ row: Int) {
        
    }
}
