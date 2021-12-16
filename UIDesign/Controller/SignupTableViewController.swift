//
//  SignupTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit
import SQLite

class SignupTableViewController: UITableViewController {

    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var textField2:UITextField!
    @IBOutlet weak var textField3:UITextField!
    @IBOutlet weak var textField4:UITextField!
    
    var database: Connection!
    
    let userTbl = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let pass = Expression<String>("pass")
    let depart = Expression<String>("depart")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            UITextField.appearance().tintColor = .orange
                //let documentDirectory = try FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("userDB").appendingPathExtension("sqlite3")
            
            self.database = try Connection(fileUrl.path)
            print("Database created")
            print(fileUrl)
            
        }
        catch
        {
            print("Database Error")
        }
        
        let createTbl = self.userTbl.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email)
            table.column(self.pass)
            table.column(self.depart)}
        
        
        
        do
        {
                try self.database.run(createTbl)
            print("Table created")
            
        }
        catch
        {
            print("Table not created")
        }

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
    
    
    
    @IBAction func SignupTap(_ sender: Any) {
        let insertEmp = self.userTbl.insert(self.name <- textField1.text!, self.email <- textField2.text!, self.pass <- textField3.text!,self.depart <- textField4.text!)
        print(insertEmp)
        do
        {
            try self.database.run(insertEmp)
            
            let alert = UIAlertController(title: "Record Info", message: "Data inserted in users table successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            print("Ok")
            
        }
        catch
        {
            print("User record insertion failed")
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
