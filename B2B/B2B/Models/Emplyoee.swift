//
//  Emplyoee.swift
//  B2B
//
//  Created by Marlon on 9/28/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import Foundation

class Employee: User {
    
    
    var jobPosition:String
    var salary:Double
    
    
    //Polymorfismo Inicializador designado
    init(jobPosition:String, salary:Double, name: String, phone: String, idUser: String) {
        
        self.jobPosition = jobPosition
        self.salary = salary
        
        super.init(name: name, phone: phone, idUser: idUser)
    }
    
    // Polimorfismo. Inicializador por conveniencia.
    convenience init() {
        self.init(jobPosition:"", salary:0.00, name: "", phone: "", idUser: "")
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Polymorfismo
    override func buy() {
        
    }
}
