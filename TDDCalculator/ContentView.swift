//
//  ContentView.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = CalculatorViewModel()
  @State var value = Double()
  @State var answerShown = false
  
  func appendDigit(_ number: Double) {
    //If the answer is shown, typing new digits should overwrite it
    if answerShown {
      answerShown = false
      value = 0
    }
    
    //Add number as a new digit, shifting the existing digits to the left
    value = number + (value * 10)
    
    //Set operand1 or operand2 depending on whether an operator has been chosen
    if viewModel.operatorType == nil {
      viewModel.operand1 = value
    } else {
      viewModel.operand2 = value
    }
  }
  
  var body: some View {
    VStack {
      Text("\(value)")
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 100), spacing: 5, alignment: .top)]) {
        ForEach(1..<10, id: \.self) {
          number in Button("\(number)") {
            appendDigit(Double(number))
          }
        }
        Button("0") {
          appendDigit(0)
        }
        Button(Operator.plus.rawValue) {
          value = 0
          viewModel.operatorType = Operator.plus
        }
        Button(Operator.minus.rawValue) {
          value = 0
          viewModel.operatorType = Operator.minus
        }
        Button(Operator.times.rawValue) {
          value = 0
          viewModel.operatorType = Operator.times
        }
        Button(Operator.divide.rawValue) {
          value = 0
          viewModel.operatorType = Operator.divide
        }
        Button("=") {
          guard let operatorType = viewModel.operatorType else {
            fatalError("No operator was set")
          }
          value = viewModel.calculate(viewModel.operand1, operatorType, viewModel.operand2)
          answerShown = true
        }
      }
      .frame(width: 200, height: 200)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
