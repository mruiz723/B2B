//
//  FirstViewController.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource {

    //MARK: - Properties
    @IBOutlet weak var userTableView: UITableView!
    var users = [User]()
    
    //MARK: - IBAction
    @IBAction func addUser(sender: AnyObject) {
        let alertController = UIAlertController(title: "Nuevo Usuario", message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (nameTextField) in
            nameTextField.placeholder = "Ingrese sus Nombres"
        }
        alertController.addTextFieldWithConfigurationHandler { (phoneTextField) in
            phoneTextField.placeholder = "Ingrese su teléfono"
        }
        
        let createUserAction = UIAlertAction(title: "Crear", style: .Default) { (alertAction) in
            if alertController.textFields![0].text?.characters.count > 0 {
               let name = alertController.textFields![0].text!
                
                if alertController.textFields![1].text?.characters.count > 0 {
                    let phone = alertController.textFields![1].text!
                    
                    let idUser = String(NSDate())
                    let user = User(name: name, phone: phone, idUser: idUser)
                    self.users.append(user)
                    User.saveUsers(self.users)
                    self.userTableView.reloadData()
                }
            }
            self.dismissViewControllerAnimated(true, completion: { 
                
            })
        }
        
        alertController.addAction(createUserAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    //MARK: - LifeCycle 
    //Polymorfismo
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = User.users()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Polymorfismo
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell")
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.phone
        
        return cell!
    }
}

