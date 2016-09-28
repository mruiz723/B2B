//
//  Client.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import Foundation

class Client: User {
    
    var idClient:String
    var product:Product
    
    //Sobrecarga. Inicializador Designado.
    init(idClient:String, product:Product, name:String, phone:String, idUser:String) {
        self.idClient = idClient
        self.product = product
        super.init(name: name, phone: phone, idUser: idUser)
    }
    
    // Polimorfismo. Inicializador por conveniencia.
    convenience init() {
        self.init(idClient:"", product: Product(), name: "", phone: "", idUser: "")
    }
    
   
    
    //MARK: - NSCoding
    required convenience init(coder aDecoder: NSCoder) {
        let idClient = aDecoder.decodeObjectForKey("idClient") as! String
        let product = aDecoder.decodeObjectForKey("product") as! Product
        
        let name = aDecoder.decodeObjectForKey("name") as! String
        let phone = aDecoder.decodeObjectForKey("phone") as! String
        let idUser = aDecoder.decodeObjectForKey("idUser") as! String
        self.init(idClient:idClient, product:product, name:name, phone:phone, idUser:idUser)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(idClient, forKey: "idClient")
        aCoder.encodeObject(product, forKey: "product")
        
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(phone, forKey: "phone")
        aCoder.encodeObject(idUser, forKey: "idUser")
    }
    
    
    //Polimorfismo
    override func buy() {
        
    }
    
    // Utils
    static func clients() -> [Client] {
        var clients = [Client]()
        let userDef = NSUserDefaults.standardUserDefaults()
        if let itemsData = userDef.objectForKey("Clients") as? NSData {
            if let items = NSKeyedUnarchiver.unarchiveObjectWithData(itemsData) as? [Client] {
                clients = items
            }
            
        }
        return clients
    }
    
    static func saveClients(clients:[Client]) {
        let userDef = NSUserDefaults.standardUserDefaults()
        
        let clientsData = NSKeyedArchiver.archivedDataWithRootObject(clients)
        userDef.setObject(clientsData, forKey: "Clients")
    }
}
