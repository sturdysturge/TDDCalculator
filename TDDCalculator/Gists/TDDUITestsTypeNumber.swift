//
//  TDDUITestsTypeNumber.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 07/11/2021.
//

/// The operations that can be performed
enum Operator: String {
  case plus = "+", minus = "-", times = "X", divide = "÷"
}


/// Taps numbers one at a time until a decimal point is found
/// - Parameter number: The number that should be typed
func typeNumber(number: Double) {
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
