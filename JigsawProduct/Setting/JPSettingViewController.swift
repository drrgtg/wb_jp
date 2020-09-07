//
//  JPSettingViewController.swift
//  JigsawProduct
//
//  Created by diantu on 2020/8/26.
//  Copyright © 2020 diantu. All rights reserved.
//

import UIKit

class JPSettingViewController: JPBaseTableViewController {

    private var cacheSize = "\(arc4random()%10).0M"
    private let settingCellID = "JPSettingTableViewCellID"
    override func preferredNavigationBarHidden() -> Bool {
        return false
    }
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Setting"
    }
    override func initSubviews() {
        super.initSubviews()
        tableView.register(UINib(nibName: "JPSettingTableViewCell", bundle: .main), forCellReuseIdentifier: settingCellID)
        tableView.separatorStyle = .none

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44   
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingCellID, for: indexPath) as! JPSettingTableViewCell
        switch indexPath.row {
        case 0:
            cell.leftLabel.text = "Current Version"
            cell.rightLabel.text = ""
        case 1:
            cell.leftLabel.text = "Clear Cache"
            cell.rightLabel.text = cacheSize
        case 2:
            cell.leftLabel.text = "Privacy Policy"
            cell.rightLabel.text = ""

        case 3:
            cell.leftLabel.text = "Terms of Service"
            cell.rightLabel.text = ""
        default:
            break
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("current Version")
        case 1:
            JPToast.showSuccess("clear successed")
            cacheSize = "0M"
            tableView.reloadData()
        case 2:
            let vc = JPPrivacyViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = JPTermServiceViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
