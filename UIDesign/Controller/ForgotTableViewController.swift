//
//  ForgotTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit

class ForgotTableViewController: UITableViewController {

    //Initializing outlets of forgot screen
    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var validate1:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hidding label
        validate1.isHidden = true
        
        //Changing cursor of textfield on click from black to orange
        UITextField.appearance().tintColor = .orange
    }
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            //Matching table cell and screen height to fit in every screen
            return UIScreen.main.bounds.height
        }
    
        override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
            
                //setting table frame to fit in a screen
                let tableViewHeight = self.tableView.frame.height
                let contentHeight = self.tableView.contentSize.height
                let centeringInset = (tableViewHeight - contentHeight) / 2.0
                let topInset = max(centeringInset, 0.0)
                self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
            }
    
    //This method is for forgot password button, it is called when tapped
    @IBAction func ForgotTap(_ sender: Any) {
        
        
        //It is to set true when null validation passes successfully
        validate1.isHidden = true
        
        
        //checking whether it is empty or not
        guard let email = textField1.text, textField1.text?.count != 0
        else{
            
            //making label visible and setting text message
            validate1.isHidden = false
            validate1.text = "Please enter your email"
            
            return
        }
        
        //just a demo alert to show user that we have sent email.
        let alert = UIAlertController(title: "Email sent", message: "We have sent you an email to recover your password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        //Change text to empty after postback
        textField1.text = ""
        
        
        
    }
}
