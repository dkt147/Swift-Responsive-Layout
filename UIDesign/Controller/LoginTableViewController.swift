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
    
    
    @IBOutlet weak var validate1:UILabel!
    @IBOutlet weak var validate2:UILabel!
    
    
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
        
        validate1.isHidden = true
        validate2.isHidden = true
        
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
        
        
        //let email = textField1.text!
        //let pass = textField2.text!
        //print(email)
        //print(pass)
        //let query = self.userTbl.filter(self.pass == pass)
        //print(query)
        
        
            //let id = Int(idTxt.text!)
        //let query = self.empTbl.filter(self.id == id!)
        
        validate1.isHidden = true
        validate2.isHidden = true
        
        guard let email = textField1.text, textField1.text?.count != 0
        else{
            validate1.isHidden = false
            validate1.text = "Please enter your email"
            return
        }
        
        guard let pass = textField2.text, textField2.text?.count != 0
        
        else{
            validate2.isHidden = false
            validate2.text = "Please enter your password"
            
            return
        }
        
        let alert = UIAlertController(title: "Login Info", message: "Login Functionality is not working yet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        textField1.text = ""
        textField2.text = ""
      
        
       // let pass = textField1.text!
        //let query = self.userTbl.filter(self.pass == pass)
        
        //let query = self.userTbl.filter(self.id != nil)
        
        do
        {
            //let user = try self.database.pluck(query)
            
           
            
        }
        catch
        {
            print(error.localizedDescription)
            print("No Record Found")
        }
        
            
            
           
        
        
    }
}
