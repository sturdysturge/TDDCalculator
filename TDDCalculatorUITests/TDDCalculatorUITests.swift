//
//  TDDCalculatorUITests.swift
//  TDDCalculatorUITests
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import XCTest

class TDDCalculatorUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }
  
  /// The operations that can be performed
  enum Operator: String {
    case plus = "+", minus = "-", times = "X", divide = "÷"
  }
  
  
  /// Taps numbers one at a time until a decimal point is found
  /// - Parameter number: The number that should be typed
  func typeNumber(_ number: Double) {
    //Convert the number to a string
    let numberString = String(format: "%.6f", number)
    //Convert the string to an array of String.Element
    let digits = Array(numberString)
    
    //Enter the first operand one digit at a time
    for digit in digits {
      if digit == "." { break } else {
        //Enter the digit
        app.buttons[String(digit)].tap()
      }
    }
  }
  
  /// Takes two numbers and returns the result of the specified operation
  /// - Parameters:
  ///   - operand1: the first number
  ///   - operatorType: the operation to be performed
  ///   - operand2: the second number
  /// - Returns: the result of the calculation
  func calculate(_ operand1: Double, _ operatorType: Operator,  _ operand2: Double) -> Double {
    //Type the first number
    typeNumber(operand1)
    
    //Enter the operator
    app.buttons[operatorType.rawValue].tap()
    
    //Type the second number
    typeNumber(operand2)
    
    //Calculate the answer
    app.buttons["="].tap()
    
    //Return the answer expected for the calculation
    switch operatorType {
    case .plus:
      return operand1 + operand2
    case .minus:
      return operand1 - operand2
    case .times:
      return operand1 * operand2
    case .divide:
      return operand1 / operand2
    }
  }
  
  /// Performs an addition calculation and checks the answer
  func testAddition() throws {
    XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
    
    //Single digit calculation
    var answer = calculate(2, .plus, 2)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
    
    //Multiple digit calculation
    answer = calculate(12, .plus, 12)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  }
  
  /// Performs a subtraction calculation and checks the answer
  func testSubtraction() throws {
    XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
    
    //Single digit calculation
    var answer = calculate(3, .minus, 2)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
    
    //Multiple digit calculation
    answer = calculate(13, .minus, 12)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  }
  
  /// Performs an multiplication calculation and checks the answer
  func testMultiplication() throws {
    XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
    
    //Single digit calculation
    var answer = calculate(3, .times, 3)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
    
    //Multiple digit calculation
    answer = calculate(13, .times, 13)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  }
  
  /// Performs an division calculation and checks the answer
  func testDivision() throws {
    XCTAssertTrue(app.staticTexts["0.000000"].exists, "Zero was not displayed on launch")
    
    //Single digit calculation
    var answer = calculate(3, .divide, 3)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
    
    //Multiple digit calculation
    answer = calculate(33, .divide, 11)
    XCTAssertTrue(app.staticTexts[String(format: "%.6f", answer)].exists, "Answer was not displayed")
  }
}
