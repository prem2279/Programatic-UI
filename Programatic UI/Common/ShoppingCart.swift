//
//  ShoppingCart.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//


struct CartItem {

    let name: String

    let price: Double

    let quantity: Int

}
 
struct ShoppingCart {

    var items: [CartItem] = []
 
    mutating func addItem(_ item: CartItem) {

        items.append(item)

    }
 
    var subtotal: Double {

        return items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }

    }
 
    var tax: Double {

        return subtotal * 0.08

    }
 
    var total: Double {

        return subtotal + tax

    }
 
    mutating func clearCart() {

        items = []

    }

}

 
