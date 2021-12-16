//
//  LoginTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var textField2:UITextField!
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

    
    @IBAction func loginTap(_ sender: Any) {
      //let namestoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = namestoryboard.instantiateViewController(withIdentifier: //"SignupTableViewController") as! SignupTableViewController
       // self.navigationController!.pushViewController(vc, animated: true)
        
        showSimpleAlert()
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: textField1.text, message: textField2.text,         preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
            print("Failed")
           }))
           alert.addAction(UIAlertAction(title: "Yes",
                                         style: UIAlertAction.Style.default,
                                         handler: {(_: UIAlertAction!) in
               print("Success")
           }))
           self.present(alert, animated: true, completion: nil)
       }
}
