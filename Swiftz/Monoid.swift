//
//  Monoid.swift
//  swiftz
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

/// A Monoid is a Semigroup that distinguishes an identity element.
public protocol Monoid : Semigroup {
    /// The identity element of the Monoid.
    class var mzero : Self { get }
}

public func mconcat<S : Monoid>(t : [S]) -> S {
    return sconcat(S.mzero, t)
}

/// The Monoid of numeric types under addition.
public struct Sum<N : Num> : Monoid {
    public let value : () -> N

    public init(_ x : @autoclosure () -> N) {
        value = x
    }

    public static var mzero : Sum<N> {
        return Sum(N.zero)
    }

    public func op(other : Sum<N>) -> Sum<N> {
        return Sum(value().plus(other.value()))
    }
}

/// The Monoid of numeric types under multiplication.
public struct Product<N : Num> : Monoid {
    public let value : () -> N

    public init(_ x : @autoclosure () -> N) {
        value = x
    }

    public static var mzero : Product<N> {
        return Product(N.one)
    }

    public func op(other : Product<N>) -> Product<N> {
        return Product(value().times(other.value()))
    }
}

/// The Semigroup-lifting Maybe Monoid
public struct AdjoinNil<A : Semigroup> : Monoid {
    public let value : () -> Maybe<A>

    public init(_ x : @autoclosure () -> Maybe<A>) {
        value = x
    }

    public static var mzero : AdjoinNil<A> {
        return AdjoinNil(Maybe.none())
    }

    public func op(other : AdjoinNil<A>) -> AdjoinNil<A> {
        if let x = value().value {
            if let y = other.value().value {
                return AdjoinNil(Maybe(x.op(y)))
            } else {
                return self
            }
        } else {
            return other
        }
    }
}

/// The left-biased Maybe Monoid.
public struct First<A : Comparable> : Monoid {
    public let value : () -> Maybe<A>

    public init(_ x : @autoclosure () -> Maybe<A>) {
        value = x
    }

    public static var mzero : First<A> {
        return First(Maybe.none())
    }

    public func op(other : First<A>) -> First<A> {
        if value().isJust() {
            return self
        } else {
            return other
        }
    }
}

/// The right-biased Maybe Monoid.
public struct Last<A : Comparable> : Monoid {
    public let value : () -> Maybe<A>

    public init(_ x : @autoclosure () -> Maybe<A>) {
        value = x
    }

    public static var mzero : Last<A> {
        return Last(Maybe.none())
    }

    public func op(other : Last<A>) -> Last<A> {
        if other.value().isJust() {
            return other
        } else {
            return self
        }
    }
}

