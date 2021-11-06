//
//  TDDUnitTests.swift
//  TDDCalculator
//
//  Created by Rob Sturgeon on 06/11/2021.
//

/// Performs an addition calculation and checks the answer
func testAddition() throws {
  let viewModel = CalculatorViewModel()
  let expectedAnswer = calculate(2, .plus, 2)
  let answer = viewModel.calculate(2, .plus, 2)
  XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
}

/// Performs an subtraction calculation and checks the answer
func testSubtraction() throws {
  let viewModel = CalculatorViewModel()
  let expectedAnswer = calculate(3, .minus, 2)
  let answer = viewModel.calculate(3, .minus, 2)
  XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
}

/// Performs an multiplication calculation and checks the answer
func testMultiplication() throws {
  let viewModel = CalculatorViewModel()
  let expectedAnswer = calculate(3, .times, 3)
  let answer = viewModel.calculate(3, .times, 3)
  XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
}

/// Performs an division calculation and checks the answer
func testDivision() throws {
  let viewModel = CalculatorViewModel()
  let expectedAnswer = calculate(3, .divide, 3)
  let answer = viewModel.calculate(3, .divide, 3)
  XCTAssertEqual(expectedAnswer, answer, "Expected answer \(expectedAnswer) was different from calculator answer \(answer)")
}
