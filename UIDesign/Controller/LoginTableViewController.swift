
import UIKit
import SQLite

class LoginTableViewController: UITableViewController {

    //Initializing outlets of textfields
    @IBOutlet weak var textField1:UITextField!
    @IBOutlet weak var textField2:UITextField!
    
    //Initializing outlets of Labels
    @IBOutlet weak var validate1:UILabel!
    @IBOutlet weak var validate2:UILabel!
    
    //Setting table values in a variable
    @IBOutlet weak var mytable: UITableView!
    var userlist = [UserTable]()
    
    
    //Initializing database connection
    var database: Connection!
    
    //Initializing attributes
    let userTbl = Table("userTbl")
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
            print("Error")
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

    
    //This method is for login button, it is called when tapped
    @IBAction func loginTap(_ sender: Any) {
        
        
        //It is to set true when null validation passes successfully
        validate1.isHidden = true
        validate2.isHidden = true
        
        //checking whether it is empty or not
        guard let email = textField1.text, textField1.text?.count != 0
        else{
            validate1.isHidden = false
            validate1.text = "Please enter your email"
            return
        }
        
        //checking whether it is empty or not
        guard let pass = textField2.text, textField2.text?.count != 0
        
        else{
            validate2.isHidden = false
            validate2.text = "Please enter your password"
            
            return
        }
        
        
        //showing demo alert after successfully passses from the validation
        let alert = UIAlertController(title: "Login Info", message: "Login Functionality is not working yet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
        //setting fields to empty on postback
        textField1.text = ""
        textField2.text = ""
      
       
        
            
            
           
        
        
    }
}
