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
    
    init(idClient:String, product:Product) {
        self.idClient = idClient
        self.product = product
        super.init(name: "", phone: "", idUser: "")
    }
    
    convenience init() {
        self.init(idClient:"", product: Product())
    }
    
}
