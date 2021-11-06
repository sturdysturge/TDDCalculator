//
//  TDDUITests Calculate.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

/// The operations that can be performed
enum Operator: String {
  case plus = "+", minus = "-", times = "X", divide = "÷"
}

/// Taps buttons on the calculator and returns the result of the calculation
/// - Parameters:
///   - operand1: the first number
///   - operatorType: the operation to be performed
///   - operand2: the second number
/// - Returns: the result of the calculation
func calculate(_ operand1: Double, _ operatorType: Operator,  _ operand2: Double) -> Double {
  //Turn the first operand into an array of digits
  let operand1Digits = Array(String(format: "%.6f", operand1))
  
  //Enter the first operand one digit at a time
  for digit in operand1Digits {
    if digit == "." { break } else {
      //Enter the digit
      app.buttons[String(digit)].tap()
    }
  }
  //Enter the operator
  app.buttons[operatorType.rawValue].tap()
  
  //Turn the second operand into an array of digits
  let operand2Digits = Array(String(format: "%.6f", operand2))
  
  //Enter the first operand one digit at a time
  for digit in operand2Digits {
    if digit == "." { break } else {
      //Enter the digit
      app.buttons[String(digit)].tap()
    }
  }
  
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
