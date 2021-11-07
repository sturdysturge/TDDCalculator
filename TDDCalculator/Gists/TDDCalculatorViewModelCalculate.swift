//
//  TDDCalculatorViewModelCalculate.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

func calculate(_ operand1: Double, _ operatorType: Operator, _ operand2: Double) -> Double {
  //where the answer will be stored
  var answer: Double?
  
  //Set the answer expected for the calculation
  switch operatorType {
  case .plus:
    answer = operand1 + operand2
  case .minus:
    answer = operand1 - operand2
  case .times:
    answer = operand1 * operand2
  case .divide:
    answer = operand1 / operand2
  }
  //Ensure answer is not nil (which should be impossible)
  guard let answer = answer else {
    fatalError("No answer was calculated")
  }
  //Remove operator after using it
  self.operatorType = nil
  //Set operand1 as the answer for future calculations
  self.operand1 = answer
  //Set operand2 to zero
  self.operand2 = 0
  //Return the answer
  return answer
}
