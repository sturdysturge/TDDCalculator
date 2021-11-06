//
//  TDDCalculatorTests.swift
//  TDDCalculatorTests
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import XCTest
@testable import TDDCalculator


class TDDCalculatorTests: XCTestCase {
  /// Makes a calculation and returns the result
  /// - Parameters:
  ///   - operand1: the first number
  ///   - operatorType: the operation to be performed
  ///   - operand2: the second number
  /// - Returns: the result of the calculation
  func calculate(_ operand1: Double, _ operatorType: Operator,  _ operand2: Double) -> Double {
    
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
    let viewModel = CalculatorViewModel()
    let expectedAnswer = calculate(2, .plus, 2)
    let answer = viewModel.calculate(2, .plus, 2)
    XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
  }
  
  /// Performs an subtraction calculation and checks the answer
  func testSubtraction() throws {
    let viewModel = CalculatorViewModel()
    let expectedAnswer = calculate(3, .minus, 2)
    let answer = viewModel.calculate(3, .minus, 2)
    XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
  }
  
  /// Performs an multiplication calculation and checks the answer
  func testMultiplication() throws {
    let viewModel = CalculatorViewModel()
    let expectedAnswer = calculate(3, .times, 3)
    let answer = viewModel.calculate(3, .times, 3)
    XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
  }
  
  /// Performs an division calculation and checks the answer
  func testDivision() throws {
    let viewModel = CalculatorViewModel()
    let expectedAnswer = calculate(3, .divide, 3)
    let answer = viewModel.calculate(3, .divide, 3)
    XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
  }
}
