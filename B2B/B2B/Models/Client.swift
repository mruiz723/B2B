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
    
    init(idClient:String, product:Product, name:String, phone:String, idUser:String) {
        self.idClient = idClient
        self.product = product
        super.init(name: name, phone: phone, idUser: idUser)
    }
    
    convenience init() {
        self.init(idClient:"", product: Product(), name: "", phone: "", idUser: "")
    }
    
}
