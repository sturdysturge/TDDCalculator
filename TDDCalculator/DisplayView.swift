//
//  DisplayView.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 07/11/2021.
//

import SwiftUI

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
