//
//  SecondViewController.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController, UITableViewDataSource, NewClientViewControllerDelegate {

    //MARK: - Properties
    @IBOutlet weak var clientTableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    var clients = [Client]()
    
    //MARK: - LifeCycle
    //Polymorfismo
    override func viewDidLoad() {
        super.viewDidLoad()
        clients = Client.clients()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Polymorfismo
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let client = clients[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("clientCell")
        cell?.textLabel?.text = client.name
        cell?.detailTextLabel?.text = String(client.product.price)
        
        return cell!
    }
    
    //MARK: - NewClientViewControllerDelegate
    func didBuyOrder(client: Client) {
        clients.append(client)
        Client.saveClients(clients)
        clientTableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newClientVC = segue.destinationViewController as? NewClientViewController {
            newClientVC.delegate = self
        }
    }
    
}

