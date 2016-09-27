//
//  User.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import Foundation

class User: NSObject {
    var idUser:String
    var name:String
    var phone:String?
    
    //Sobrecarga. Inicializador Designado.
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
    
    func buy() {
        print("User is buying")
    }

}
