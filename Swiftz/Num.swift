//
//  Num.swift
//  swiftz
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//


/// `Num`eric types.
public protocol Num {
	/// The null quantity.
	static var zero : Self { get }
	/// The singular quantity.
	static var one : Self { get }
	
	/// The magnitude of the quantity.
	var signum : Self { get }
	/// A quantity with the opposing magnitude of the receiver.
	var negate : Self { get }
	
	/// The quantity produced by adding the given quantity to the receiver.
	func plus(_ : Self) -> Self
	/// The quantity produced by subtracting the given quantity from the receiver.
	func minus(_ : Self) -> Self
	/// The quantity produced by multiplying the receiver by the given quantity.
	func times(_ : Self) -> Self
}

extension Int : Num {
	public static var zero : Int { return 0 }
	public static var one : Int { return 1 }
	public var signum : Int {
		if self < 0 {
			return -1
		} else if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : Int { return -self }
	public func plus(other : Int) -> Int { return self + other }
	public func minus(other : Int) -> Int { return self - other }	
	public func times(other : Int) -> Int { return self * other }
}

extension Int8 : Num {
	public static var zero : Int8 { return 0 }
	public static var one : Int8 { return 1 }
	public var signum : Int8 {
		if self < 0 {
			return -1
		} else if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : Int8 { return -self }
	public func plus(other : Int8) -> Int8 { return self + other }
	public func minus(other : Int8) -> Int8 { return self - other }	
	public func times(other : Int8) -> Int8 { return self * other }
}

extension Int16 : Num {
	public static var zero : Int16 { return 0 }
	public static var one : Int16 { return 1 }
	public var signum : Int16 {
		if self < 0 {
			return -1
		} else if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : Int16 { return -self }
	public func plus(other : Int16) -> Int16 { return self + other }
	public func minus(other : Int16) -> Int16 { return self - other }	
	public func times(other : Int16) -> Int16 { return self * other }
}

extension Int32 : Num {
	public static var zero : Int32 { return 0 }
	public static var one : Int32 { return 1 }
	public var signum : Int32 {
		if self < 0 {
			return -1
		} else if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : Int32 { return -self }
	public func plus(other : Int32) -> Int32 { return self + other }
	public func minus(other : Int32) -> Int32 { return self - other }	
	public func times(other : Int32) -> Int32 { return self * other }
}

extension Int64 : Num {
	public static var zero : Int64 { return 0 }
	public static var one : Int64 { return 1 }
	public var signum : Int64 {
		if self < 0 {
			return -1
		} else if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : Int64 { return -self }
	public func plus(other : Int64) -> Int64 { return self + other }
	public func minus(other : Int64) -> Int64 { return self - other }	
	public func times(other : Int64) -> Int64 { return self * other }
}

extension UInt : Num {
	public static var zero : UInt { return 0 }
	public static var one : UInt { return 1 }
	public var signum : UInt {
		if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : UInt { return undefined() }
	public func plus(other : UInt) -> UInt { return self + other }
	public func minus(other : UInt) -> UInt { return self - other }	
	public func times(other : UInt) -> UInt { return self * other }
}

extension UInt8 : Num {
	public static var zero : UInt8 { return 0 }
	public static var one : UInt8 { return 1 }
	public var signum : UInt8 {
		if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : UInt8 { return undefined() }
	public func plus(other : UInt8) -> UInt8 { return self + other }
	public func minus(other : UInt8) -> UInt8 { return self - other }	
	public func times(other : UInt8) -> UInt8 { return self * other }
}

extension UInt16 : Num {
	public static var zero : UInt16 { return 0 }
	public static var one : UInt16 { return 1 }
	public var signum : UInt16 {
		if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : UInt16 { return undefined() }
	public func plus(other : UInt16) -> UInt16 { return self + other }
	public func minus(other : UInt16) -> UInt16 { return self - other }	
	public func times(other : UInt16) -> UInt16 { return self * other }
}

extension UInt32 : Num {
	public static var zero : UInt32 { return 0 }
	public static var one : UInt32 { return 1 }
	public var signum : UInt32 {
		if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : UInt32 { return undefined() }
	public func plus(other : UInt32) -> UInt32 { return self + other }
	public func minus(other : UInt32) -> UInt32 { return self - other }	
	public func times(other : UInt32) -> UInt32 { return self * other }
}

extension UInt64 : Num {
	public static var zero : UInt64 { return 0 }
	public static var one : UInt64 { return 1 }
	public var signum : UInt64 {
		if self > 0 {
			return 1
		}
		return 0
	}
	public var negate : UInt64 { return undefined() }
	public func plus(other : UInt64) -> UInt64 { return self + other }
	public func minus(other : UInt64) -> UInt64 { return self - other }	
	public func times(other : UInt64) -> UInt64 { return self * other }
}


public protocol Real : Num, Comparable { }

extension Int : Real { }
extension Int8 : Real { }
extension Int16 : Real { }
extension Int32 : Real { }
extension Int64 : Real { }
extension UInt : Real { }
extension UInt8 : Real { }
extension UInt16 : Real { }
extension UInt32 : Real { }
extension UInt64 : Real { }

/// Numeric types that support division.
public protocol Integral : Real {
	/// Simultaneous quotient and remainder.
	func quotientRemainder(_ : Self) -> (quotient : Self, remainder : Self)
}

extension Integral {
	public func quotient(d : Self) -> Self {
		return self.quotientRemainder(d).quotient
	}

	public func remainder(d : Self) -> Self {
		return self.quotientRemainder(d).remainder
	}
	
	public func divide(d : Self) -> Self {
		return self.divMod(d).quotient
	}
	
	public func mod(d : Self) -> Self {
		return self.divMod(d).modulus
	}
	
	public func divMod(d : Self) -> (quotient : Self, modulus : Self) {
		let (q, r) = self.quotientRemainder(d)
		if r.signum == d.signum.negate {
			return (q.minus(Self.one), r.plus(d))
		}
		return (q, r)
	}
}

extension Int : Integral {
	public func quotientRemainder(d : Int) -> (quotient : Int, remainder : Int) { return (self / d, self % d) }
}

extension Int8 : Integral {
	public func quotientRemainder(d : Int8) -> (quotient : Int8, remainder : Int8) { return (self / d, self % d) }
}

extension Int16 : Integral {
	public func quotientRemainder(d : Int16) -> (quotient : Int16, remainder : Int16) { return (self / d, self % d) }
}

extension Int32 : Integral {
	public func quotientRemainder(d : Int32) -> (quotient : Int32, remainder : Int32) { return (self / d, self % d) }
}

extension Int64 : Integral {
	public func quotientRemainder(d : Int64) -> (quotient : Int64, remainder : Int64) { return (self / d, self % d) }
}

extension UInt : Integral {
	public func quotientRemainder(d : UInt) -> (quotient : UInt, remainder : UInt) { return (self / d, self % d) }
}

extension UInt8 : Integral {
	public func quotientRemainder(d : UInt8) -> (quotient : UInt8, remainder : UInt8) { return (self / d, self % d) }
}

extension UInt16 : Integral {
	public func quotientRemainder(d : UInt16) -> (quotient : UInt16, remainder : UInt16) { return (self / d, self % d) }
}

extension UInt32 : Integral {
	public func quotientRemainder(d : UInt32) -> (quotient : UInt32, remainder : UInt32) { return (self / d, self % d) }
}

extension UInt64 : Integral {
	public func quotientRemainder(d : UInt64) -> (quotient : UInt64, remainder : UInt64) { return (self / d, self % d) }
}
