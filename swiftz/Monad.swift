//
//  Monad.swift
//  swiftz
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

protocol Monad: Applicative {
    func bind(FA) -> (A -> FB) -> FB
}
