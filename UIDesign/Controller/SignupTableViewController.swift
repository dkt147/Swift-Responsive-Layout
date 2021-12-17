//
//  SignupTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit
import SQLite

class SignupTableViewController: UITableViewController {

    //Initializing outlets of textfields
    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var textField2:UITextField!
    @IBOutlet weak var textField3:UITextField!
    @IBOutlet weak var textField4:UITextField!
    
    //Initializing outlets of Labels
    @IBOutlet weak var validate1:UILabel!
    @IBOutlet weak var validate2:UILabel!
    @IBOutlet weak var validate3:UILabel!
    @IBOutlet weak var validate4:UILabel!
    
    
    //Initializing database connection
    var database: Connection!
    
    //Initializing table name
    let userTbl = Table("users")
    
    //Initializing attributes
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let pass = Expression<String>("pass")
    let depart = Expression<String>("depart")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide validation labels
        validate1.isHidden = true
        validate2.isHidden = true
        validate3.isHidden = true
        validate4.isHidden = true
        
        do
        {
            //changing cursor color from black to orange
            UITextField.appearance().tintColor = .orange
            
            
            //Setting database url
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            //Setting path to create database file
            let fileUrl = documentDirectory.appendingPathComponent("userDB").appendingPathExtension("sqlite3")
            
            //checking the file is present or not
            self.database = try Connection(fileUrl.path)
            print("Database created")
            
            //database file url to check manually
            print(fileUrl)
            
        }
        catch
        {
            print("Database Error")
        }
        
        //Creating user table
        let createTbl = self.userTbl.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email)
            table.column(self.pass)
            table.column(self.depart)}
        
        
        
        do
        {
            //running create table query
                try self.database.run(createTbl)
            print("Table created")
            
        }
        catch
        {
            print("Table not created")
        }

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
    
    
    //This method is for signup button, it is called when tapped
    @IBAction func SignupTap(_ sender: Any) {
        
        //It is to set true when null validation passes successfully
        validate1.isHidden = true
        validate2.isHidden = true
        validate3.isHidden = true
        validate4.isHidden = true
        
        //checking whether it is empty or not
        guard let name = textField1.text, textField1.text?.count != 0
        else{
            validate1.isHidden = false
            validate1.text = "Please enter your name"
            return
        }
        
        //checking whether it is empty or not
        guard let email = textField2.text, textField2.text?.count != 0
        
        else{
            validate2.isHidden = false
            validate2.text = "Please enter your email"
            
            return
        }
        
        //checking whether it is empty or not
        guard let pass = textField3.text, textField3.text?.count != 0
        else{
            validate3.isHidden = false
            validate3.text = "Please enter your password"
            return
        }
        
        //checking whether it is empty or not
        guard let depart = textField4.text, textField4.text?.count != 0
        else{
            validate4.isHidden = false
            validate4.text = "Please enter your department"
            return
        }
        
        
        
        //It will be helpful in future for email validation
        //func isValidEmail(email:String) -> Bool
       // {
         //   let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         //   let emailTest = NSPredicate(format: "SELF MATCHES %@", email)
         //   return emailTest.evaluate(with: email)
       // }
        
        
        
        
        //insert query to insert data in table column
        let insertEmp = self.userTbl.insert(self.name <- textField1.text!, self.email <- textField2.text!, self.pass <- textField3.text!,self.depart <- textField4.text!)
        print(insertEmp)
        do
        {
            //running query
            try self.database.run(insertEmp)
            
            //showing alert after successfully submit the data
            let alert = UIAlertController(title: "Record Info", message: "Data inserted in users table successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            //setting fields to empty on postback
            textField1.text = ""
            textField2.text = ""
            textField3.text = ""
            textField4.text = ""
            
        }
        catch
        {
            print("User record insertion failed")
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
