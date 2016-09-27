//
//  Product.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class Product: NSObject {

    var idProduct:String
    var name:String
    var price:Double
    
     //Sobrecarga. Inicializador Designado.
    init(idProduct:String, name:String, price:Double) {
        self.idProduct = idProduct
        self.name = name
        self.price = price
    }
    
    // Polimorfismo. Inicializador por conveniencia.
    override convenience init() {
        self.init(idProduct:"", name:"", price:0.00)
    }
}
