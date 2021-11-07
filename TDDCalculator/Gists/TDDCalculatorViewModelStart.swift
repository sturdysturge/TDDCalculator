//
//  CalculatorViewModel.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import Foundation

/// The operations that can be performed
enum Operator: String, CaseIterable {
  case plus = "+", minus = "-", times = "X", divide = "÷"
}


/// The requirements for the ObservableObject that stores data and performs calculations
protocol Calculatable: ObservableObject {
  /// Makes a calculation and returns the result
  /// - Parameters:
  ///   - operand1: the first number
  ///   - operatorType: the operation to be performed
  ///   - operand2: the second number
  /// - Returns: the result of the calculation
  func calculate(_ operand1: Double, _ operatorType: Operator,  _ operand2: Double) -> Double
  
  /// The first number
  var operand1: Double { get }
  /// The second number
  var operand2: Double { get }
  /// The operation to be completed
  var operatorType: Operator? { get }
}


/// The ObservableObject that stores data and performs calculations
class CalculatorViewModel: Calculatable {
  
  @Published var operand1 = Double()
  @Published var operand2 = Double()
  @Published var operatorType: Operator?
  
  func calculate(_ operand1: Double, _ operatorType: Operator, _ operand2: Double) -> Double { return -1 }
}
