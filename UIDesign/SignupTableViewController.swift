//
//  SignupTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit

class SignupTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.height
        }
    
        override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                let tableViewHeight = self.tableView.frame.height
                let contentHeight = self.tableView.contentSize.height
                
                let centeringInset = (tableViewHeight - contentHeight) / 2.0
                let topInset = max(centeringInset, 0.0)
                
                self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
            }
}
