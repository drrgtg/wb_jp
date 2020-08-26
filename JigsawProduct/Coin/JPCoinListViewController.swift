//
//  JPCoinListViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPCoinListViewController: JPBaseTableViewController {

    private let JPCoinCellID = "JPCoinListTableViewCellID"
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
    override func initSubviews() {
        super.initSubviews()
        // rightBar
        let rightBtn = QMUIButton(type: .custom)
        rightBtn.setImage(UIImage(named: "icon_gold_small"), for: .normal)
        rightBtn.spacingBetweenImageAndTitle = 6
        rightBtn.titleLabel?.text = "109"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        tableView.register(UINib(nibName: "JPCoinListTableViewCell", bundle: .main), forCellReuseIdentifier: JPCoinCellID)
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JPCoinCellID, for: indexPath) as! JPCoinListTableViewCell
        cell.coinCountLabel.text = "X 100"
        cell.payBtn.setTitle("$0.99", for: .normal)
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
