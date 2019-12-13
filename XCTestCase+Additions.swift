//
//  XCTestCase+Additions.swift
//  idusTests
//
//  Created by seungjin on 2019/12/14.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
  
  func expectation(_ handler: @escaping (XCTestExpectation) -> Void) {
      let expectation = XCTestExpectation(description: "com.jinnify.idus.async.expectation")
      handler(expectation)
      wait(for: [expectation], timeout: 10)
  }
}
