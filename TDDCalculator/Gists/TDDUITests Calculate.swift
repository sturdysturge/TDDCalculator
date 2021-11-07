//
//  TDDUITests Calculate.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

/// Takes two numbers and returns the result of the specified operation
/// - Parameters:
///   - operand1: the first number
///   - operatorType: the operation to be performed
///   - operand2: the second number
/// - Returns: the result of the calculation
func calculate(_ operand1: Double, _ operatorType: Operator,  _ operand2: Double) -> Double {
  //Type the first number
  typeDigits(number: operand1)
  
  //Enter the operator
  app.buttons[operatorType.rawValue].tap()
  
  //Type the second number
  typeDigits(number: operand2)
  
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
