//
//  NewClientViewController.swift
//  B2B
//
//  Created by Marlon on 9/28/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

protocol NewClientViewControllerDelegate {

    func didBuyOrder(client:Client)
}

class NewClientViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var productTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var userTableView: UITableView!
    
    let pickerView = UIPickerView()
    var product: Product?
    var products = [Product]()
    var users = [User]()
    var user:User?
    
    var delegate:NewClientViewControllerDelegate?
    
    //MARK: - IBActions
    
    @IBAction func cancel(sender: AnyObject) {
        self.view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buy(sender: AnyObject) {
        let idClient = String(NSData())
        if let currentUser = user {
            if product != nil {
                let client = Client(idClient: idClient, product: product!, name: currentUser.name, phone: currentUser.phone, idUser: currentUser.idUser)
                
                delegate?.didBuyOrder(client)
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = User.users()
        products = Product.products()
       
        pickerView.dataSource = self
        pickerView.delegate = self
        productTextField.inputView = pickerView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        user = users[indexPath.row]
        nameTextField.text = user!.name
        phoneTextField.text = user!.phone
        
    }
    
    
    //MARK: - UIPickerViewDataSource
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return products.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let product = products[row]
        return product.name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        product = products[row]
        priceTextField.text = product?.price
        productTextField.text = product!.name
    }
}
