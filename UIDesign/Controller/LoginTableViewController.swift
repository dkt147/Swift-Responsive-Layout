//
//  LoginTableViewController.swift
//  UIDesign
//
//  Created by JOEYCO-0072PK on 15/12/2021.
//

import UIKit
import SQLite

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var textField2:UITextField!
    
    @IBOutlet weak var lbl1:UILabel!
    @IBOutlet weak var lbl2:UILabel!
    
    
    @IBOutlet weak var mytable: UITableView!
    var userlist = [UserTable]()
    
    var database: Connection!
    let userTbl = Table("userTbl")
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
            print("Error")
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

    
    @IBAction func loginTap(_ sender: Any) {
        
        
        let email = textField1.text!
        let pass = textField2.text!
        print(email)
        print(pass)
        let query = self.userTbl.filter(self.pass == pass)
        //print(query)
        
        
            //let res = try self.database.pluck(query)
            let res = userTbl.select(email)   // WHERE "name" IS NOT NULL
            //print res of query
            print(res)
            
            
           
        
        
    }
}
