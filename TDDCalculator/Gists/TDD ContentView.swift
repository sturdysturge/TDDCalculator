
//
//  ContentView.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import SwiftUI

extension Color {
  static let background = Color(UIColor.systemBackground)
}


/// A rounded button style that works in both light and dark mode
struct CalculatorButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(.primary)
      configuration.label
        .padding(5)
        .foregroundColor(.background)
    }
    .aspectRatio(1, contentMode: .fit)
  }
}

struct ContentView: View {
  @StateObject var viewModel = CalculatorViewModel()
  @State var value = Double()
  @State var answerShown = false
  //Columns are all the same size but grow and shrink to fill the space
  let gridItem = GridItem(.adaptive(minimum: 50, maximum: 100), spacing: 5, alignment: .top)
  
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
      DisplayView(value: value)
      
      //Identical columns are added until the horizontal space is filled
      LazyVGrid(columns: [gridItem]) {
        
        //Number buttons 1 to 9
        ForEach(1...9, id: \.self) {
          number in Button("\(number)") {
            appendDigit(Double(number))
          }
        }
        
        //Zero button
        Button("0") { appendDigit(0) }
        
        //Operators
        ForEach(Operator.allCases, id: \.self) {
          operatorType in
          Button(operatorType.rawValue) {
            value = 0
            viewModel.operatorType = operatorType
          }
        }
        
        //Equals button
        Button("=") {
          guard let operatorType = viewModel.operatorType else { return }
          value = viewModel.calculate(viewModel.operand1, operatorType, viewModel.operand2)
          answerShown = true
        }
      }
    }
    .padding(20)
    .buttonStyle(CalculatorButtonStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView()
    ContentView().preferredColorScheme(.dark)
  }
}

struct DisplayView: View {
  let value: Double
  var body: some View {
    ZStack {
      HStack {
        Spacer()
        Text("\(value)")
          .font(.custom("Menlo", size: 15))
          .padding(10)
      }
      RoundedRectangle(cornerRadius: 5)
        .stroke(Color.primary, lineWidth: 2)
    }
    .frame(height: 20)
    .padding(.vertical)
  }
}
