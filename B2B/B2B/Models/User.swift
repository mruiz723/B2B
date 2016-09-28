//
//  User.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    var idUser:String
    var name:String
    var phone:String
    
    //Inicializador Designado.
    init(name:String, phone:String, idUser:String) {
        self.name = name
        self.phone = phone
        self.idUser = idUser
        
        super.init()
    }
    
    // Polimorfismo. Inicializador por conveniencia. 
    override convenience init() {
        self.init(name:"", phone: "", idUser:"")

    }
    
    //MARK: - NSCoding  Sobrecarga
    required convenience init(coder aDecoder: NSCoder) {
        let idUser = aDecoder.decodeObjectForKey("idUser") as! String
        let name = aDecoder.decodeObjectForKey("name") as! String
        let phone = aDecoder.decodeObjectForKey("phone") as! String
        self.init(name: name, phone: phone, idUser: idUser)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(idUser, forKey: "idUser")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(phone, forKey: "phone")
    }
    
    //MARK: - Utils
    static func users() -> [User] {
        var users = [User]()
        let userDef = NSUserDefaults.standardUserDefaults()
        if let itemsData = userDef.objectForKey("Users") as? NSData {
            if let items = NSKeyedUnarchiver.unarchiveObjectWithData(itemsData) as? [User] {
                users = items
            }
            
        }
        return users
    }
    
    static func saveUsers(users:[User]) {
        let userDef = NSUserDefaults.standardUserDefaults()
        
        let usersData = NSKeyedArchiver.archivedDataWithRootObject(users)
        userDef.setObject(usersData, forKey: "Users")
    }

}
