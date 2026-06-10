//
//  ShoppingCartTestCases.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//
import XCTest
@testable import Programatic_UI

final class ShoppingCartTestCases: XCTestCase {
    var shoppingCart: ShoppingCart!
    override func setUpWithError() throws{
        shoppingCart = ShoppingCart()
        shoppingCart.items = [
          CartItem(
              name: "Banana",
              price: 50.0,
              quantity: 2
          )]
    }
    
    override func tearDownWithError() throws{
        shoppingCart = nil
    }
}

extension ShoppingCartTestCases {
    func testCartIsEmpty(){
        shoppingCart.clearCart()
        XCTAssertEqual(shoppingCart.subtotal, 0)
    }
    
    func testSubTotalForOneItem(){
        XCTAssertEqual(shoppingCart.subtotal, 100.0)
    }
    
    func testSubTotalForMultipleItems(){
        shoppingCart.addItem(
            CartItem(
                name: "Apple",
                price: 60.0,
                quantity: 2
            ))
        XCTAssertEqual(shoppingCart.subtotal, 220.0)
    }
    
    func testTaxForCartItems(){
        XCTAssertEqual(shoppingCart.tax, 8.0)
    }
    
    func testTotalForCartItems(){
        XCTAssertEqual(shoppingCart.total, 108.0)
    }
    
    func testAddItems() {
        let countBefore = shoppingCart.items.count
        shoppingCart.addItem(
            CartItem(
                name: "Apple",
                price: 100.0,
                quantity: 1
            ))
        
        XCTAssertEqual(shoppingCart.items.count, countBefore+1)
    }
}
