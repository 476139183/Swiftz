//
//  StateSpec.swift
//  Swiftz
//
//  Created by Robert Widmann on 2/27/15.
//  Copyright (c) 2015 TypeLift. All rights reserved.
//

import XCTest
import Swiftz
import SwiftCheck

struct StateOf<S, A : Arbitrary> : Arbitrary, CustomStringConvertible {
    let getState : State<S, A>
    
    init(_ state : State<S, A>) {
        self.getState = state
    }
    
    var description : String {
        return "\(self.getState)"
    }
    
    private static func create(opt : State<S, A>) -> StateOf<S, A> {
        return StateOf(opt)
    }
    
    static func arbitrary() -> Gen<StateOf<S, A>> {
        fatalError()
    }
    
    static func shrink(bl : StateOf<S, A>) -> [StateOf<S, A>] {
        return []
    }
}

class StateSpec : XCTestCase {
}
