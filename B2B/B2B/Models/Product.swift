//
//  Product.swift
//  B2B
//
//  Created by Marlon on 9/27/16.
//  Copyright © 2016 nextu. All rights reserved.
//

import UIKit

class Product: NSObject, NSCoding {

    var idProduct:String
    var name:String
    var price:String
    
     //Sobrecarga. Inicializador Designado.
    init(idProduct:String, name:String, price:String) {
        self.idProduct = idProduct
        self.name = name
        self.price = price
    }
    
    // Polimorfismo. Inicializador por conveniencia.
    override convenience init() {
        self.init(idProduct:"", name:"", price:"US 0.00")
    }
    
    
    required convenience init(coder aDecoder: NSCoder) {
        let idProduct = aDecoder.decodeObjectForKey("idProduct") as! String
        let name = aDecoder.decodeObjectForKey("name") as! String
        let price = aDecoder.decodeObjectForKey("price") as! String
        
        self.init(idProduct:idProduct, name:name, price:price)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(idProduct, forKey: "idProduct")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(price, forKey: "price")
    }
    
    static func products() -> [Product] {
        var products = [Product]()
        
        let data = [
            ["idProduct":"", "name":"", "price":""],
            ["idProduct":"1A", "name":"2GB Datos", "price":"US 10.00"],
            ["idProduct":"1B", "name":"4GB Datos", "price":"US 15.00"],
        
        ]
        
        for item in data {
            let product = Product(idProduct: item["idProduct"]!, name: item["name"]!, price: item["price"]!)
            products.append(product)
        }
        return products
    }
    
}
