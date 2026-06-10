//
//  Programatic_UITests.swift
//  Programatic UITests
//
//  Created by Prem Kumar Gundu on 6/4/26.
//

import XCTest
@testable import Programatic_UI

final class Programatic_UITests: XCTestCase {
    
    var objCalculator: CalculatorProtocol?
    var objCircle: Circle?
    var objTodoManager: TodoManager?

    override func setUpWithError() throws  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        objCalculator = Calculator()
        objTodoManager = TodoManager()
        
    }

    override func tearDownWithError() throws {
        
        objCalculator = nil
        objTodoManager = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

//MARK: - Test Cases For Calculator

extension Programatic_UITests{
    func testSum() {
        let result = objCalculator?.sum(n1: 1, n2: 2)
        // 3 -- Success
        // 4 -- failed
        XCTAssertEqual(result, 3)
    }
    
    func testSumForOptionalValue() {
        let result = objCalculator?.sum(n1: 1, n2: nil)
        XCTAssertEqual(result, 0)
    }
    
    func testMultiplication() {
        let result = objCalculator?.mul(n1: 10, n2: 20)
        XCTAssertEqual(result, 200)
    }
    
    func testMulForOptionalValue(){
        let result = objCalculator?.mul(n1: 10, n2: nil)
        XCTAssertEqual(result, 0)
    }
    
    func testSubtract() {
        let result = objCalculator?.sub(n1: 1, n2: 2)
        XCTAssertEqual(result, -1)
    }
    
    func testSubForOptionalValue(){
        let result = objCalculator?.sub(n1: 10, n2: nil)
        XCTAssertEqual(result, 0)
    }
    
    func testDivision() {
        let result = objCalculator?.div(n1: 20, n2: 10)
        XCTAssertEqual(result, 2)
    }
    
    func testDivForOptionalValue(){
        let result = objCalculator?.div(n1: 10, n2: nil)
        XCTAssertEqual(result, 0)
    }
    
    func testDivForZeroDenominator(){
        let result = objCalculator?.div(n1: 10, n2: 0)
        XCTAssertEqual(result, 0)
    }
}

//MARK: - Test Cases For Circle

extension Programatic_UITests{
    
    func testAreaComutedProperty(){
        objCircle = Circle(radius: 5)
        let res = objCircle?.area
        let radius = objCircle?.radius
        XCTAssertEqual(res, Double.pi * radius! * radius!)
    }
    
    func testCircumferenceComutedProperty(){
        objCircle = Circle(radius: 5)
        let res = objCircle?.circumference
        let radius = objCircle?.radius
        XCTAssertEqual(res, 2*Double.pi * radius!)
    }
    
    func testAreaComutedPropertyForRadiusZero(){
        objCircle = Circle(radius: 0)
        let res = objCircle?.area
        XCTAssertEqual(res, 0)
    }
    
    func testAreaNeverNegative(){
        objCircle = Circle(radius: -5)
        XCTAssertGreaterThan(objCircle!.area,Double(0))
    }
}

//MARK: - Test Cases For Greet User

extension Programatic_UITests{
    func testGreetUserWithEmptyValue(){
        let res = greetUser(name: "")
        XCTAssertEqual(res,"Hello, Guest!" )
    }
    
    func testGreetUser(){
        let res = greetUser(name: "Prem")
        XCTAssertEqual(res,"Hello, Prem!" )
    }
    
    func testGreetUserWithSpaces(){
        let res = greetUser(name: "P r e m")
        XCTAssertEqual(res,"Hello, P r e m!" )
    }
    
    func testGreetUserWithNumbers(){
        let res = greetUser(name: "Prem 1")
        XCTAssertEqual(res,"Hello, Prem 1!" )
    }
    
}

//MARK: - Test Cases For TODO List

extension Programatic_UITests{
    func testItemsCountWhenEmpty(){
        objTodoManager?.items = []
        XCTAssertEqual(objTodoManager?.count,0)
    }
    
    func testItemsCountAddItems(){
        let res  = objTodoManager!.count
        objTodoManager?.addItem("Prem")
        XCTAssertGreaterThan(objTodoManager!.count,res)
    }
    
    func testItemsCountRemoveItems(){
        objTodoManager?.addItem("Prem")
        let res  = objTodoManager!.count
        objTodoManager?.removeItem(at: 0)
        XCTAssertLessThan(objTodoManager!.count,res)
    }
    
    func testAddItems(){
        objTodoManager?.addItem("Prem")
        XCTAssertTrue(objTodoManager!.items.contains("Prem"))
    }
    
    func testRemoveItems(){
        objTodoManager?.addItem("Prem")
        objTodoManager?.removeItem(at: 0)
        XCTAssertFalse(objTodoManager!.items.contains("Prem"))
    }

}


