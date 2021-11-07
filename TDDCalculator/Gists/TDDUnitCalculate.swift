//
//  TDDUnitCalculate.swift
//  TDDCalculator
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
}
