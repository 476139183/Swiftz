//
//  DataTests.swift
//  swiftz
//
//  Created by Maxwell Swadling on 9/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

import XCTest
import swiftz

class DataTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }

  func testNum() {
    // TODO: test num
  }
  
  func testList() {
    // TODO: test list
  }
  
  func testEither() {
    func divTwoEvenly(x: Int) -> Either<String, Int> {
      if x % 2 == 0 {
        return .Left("\(x) was div by 2")
      } else {
        return .Right(x / 2)
      }
    }
    
    // TODO: test <^>, <*> and pure
    
    let start = 17
    let first: Either<String, Int> = divTwoEvenly(start)
    let prettyPrinted: Either<String, String> = { $0.description } <^> first
    let snd = first >>= divTwoEvenly
    XCTAssert(prettyPrinted == .Right("8"))
    XCTAssert(snd == .Left("8 was div by 2"))
  }
  
  func testResult() {
    // TODO: test <^>, <*> and pure
    
    let divisionError = NSError.errorWithDomain("DivisionDomain", code: 1, userInfo: nil)
    
    func divTwoEvenly(x: Int) -> Result<Int> {
      if x % 2 == 0 {
        return .Error(divisionError)
      } else {
        return .Value({ x / 2 })
      }
    }
    
    let start = 17
    let first: Result<Int> = divTwoEvenly(start)
    let prettyPrinted: Result<String> = { $0.description } <^> first
    let snd = first >>= divTwoEvenly
    XCTAssert(prettyPrinted == .Value({ "8" }))
    XCTAssert(snd == .Error(divisionError))
  }
  
  func testFunctor() {
    // TODO: test functor in general?
  }
  
  func testMaybeFunctor() {
    let x = Maybe.just(2)
    let y = MaybeF(m: x).fmap({ $0 * 2 })
    XCTAssert(y == Maybe.just(4))
    
    let a = Maybe<Int>.none()
    let b = MaybeF(m: a).fmap({ $0 * 2 })
    XCTAssert(b == a);
  }
  
  func testDataSemigroup() {
    let xs = [1, 2, 0, 3, 4]
    XCTAssert(sconcat(Min(), 2, xs) == 0, "sconcat works")
  }
  
  func testDataMonoid() {
    let xs: Array<Int8> = [1, 2, 0, 3, 4]
    XCTAssert(mconcat(Sum    <Int8, NInt8>(i: { return nint8 }), xs) == 10, "monoid sum works")
    XCTAssert(mconcat(Product<Int8, NInt8>(i: { return nint8 }), xs) == 0, "monoid product works")
  }

  func testDataJSON() {
    let js: NSData = "[1,\"foo\"]".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    let lhs: JSValue = JSValue.decode(js)
    let rhs: JSValue = .JSArray([.JSNumber(1), .JSString("foo")])
    XCTAssert(lhs == rhs)
    XCTAssert(rhs.encode() == js)
    
    // user example
    let userjs: NSData = "{\"name\": \"max\", \"age\": 10, \"tweets\": [\"hello\"], \"attrs\": {\"one\": \"1\"}}"
      .dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    let user: User? = JSValue.decode(userjs) >>= User.fromJSON
    XCTAssert(user! == User("max", 10, ["hello"], ["one": "1"]))
    
    // not a user, missing age
    let notuserjs: NSData = "{\"name\": \"max\", \"tweets\": [\"hello\"], \"attrs\": {\"one\": \"1\"}}".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    let notUser: User? = JSValue.decode(notuserjs) >>= User.fromJSON
    if notUser {
      XCTFail("expected none")
    }
  }

}
