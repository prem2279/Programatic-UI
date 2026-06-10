//
//  LoginTestCases.swift
//  Programatic UITests
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

import XCTest
@testable import Programatic_UI

final class LoginTestCases: XCTestCase {
    var validator: LoginValidator!

    override func setUpWithError() throws {
        //print("called setUpWithError")
        validator = LoginValidator()
    }

    override func tearDownWithError() throws {
        //print("called tearDownWithError")
        validator = nil
    }
}

//MARK: - Email Test Cases
extension LoginTestCases {
    func testValidEmail(){
        XCTAssertTrue(validator.isValidEmail("prem@gmail.com"))
    }

    func testEmailWithoutAt(){
        XCTAssertFalse(validator.isValidEmail("premgmail.com"))
    }

    func testEmailWithoutDot(){
        XCTAssertFalse(validator.isValidEmail("prem@gmailcom"))
    }

    func testEmptyEmail(){
        XCTAssertFalse(validator.isValidEmail(""))
    }
}

//MARK: - Password Test Cases

extension LoginTestCases {
    func testPasswordWithEightCharacters(){
        XCTAssertTrue(validator.isValidPassword("12345678"))
    }

    func testPasswordWithSevenCharacters(){
        XCTAssertFalse(validator.isValidPassword("1234567"))
    }

    func testEmptyPassword(){
        XCTAssertFalse(validator.isValidPassword(""))
    }
}

//MARK: - Can Login Test Cases

extension LoginTestCases {
    func testEmailAndPasswordValid(){
        //print("testEmailAndPasswordValid")
        XCTAssertTrue(validator.canLogin(
            email: "prem@gmail.com",
            password: "12345678"
        ))
    }
    
    func testLoginWhenPasswordIsInValid(){
        XCTAssertFalse(validator.canLogin(
            email: "prem@gmail.com",
            password: "1234567"
        ))
    }
    
    func testLoginWhenEmailIsInValid(){
        XCTAssertFalse(validator.canLogin(
            email: "prem@gmailcom",
            password: "12345678"
        ))
    }
}
