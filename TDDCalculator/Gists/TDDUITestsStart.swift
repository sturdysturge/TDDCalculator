//
//  TDDUITestsStart.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

import XCTest

class TDDCalculatorUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }
}
