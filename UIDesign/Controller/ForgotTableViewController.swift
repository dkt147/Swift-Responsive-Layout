//
//  ForgotTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit

class ForgotTableViewController: UITableViewController {

    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var validate1:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validate1.isHidden = true
        UITextField.appearance().tintColor = .orange
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
    
    
    @IBAction func ForgotTap(_ sender: Any) {
        
        validate1.isHidden = true
        guard let email = textField1.text, textField1.text?.count != 0
        else{
            validate1.isHidden = false
            validate1.text = "Please enter your email"
            return
        }
        
        let alert = UIAlertController(title: "Email sent", message: "We have sent you an email to recover your password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        textField1.text = ""
        
        
        
    }
}
