//
//  Base.swift
//  swiftz
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

func identity<A>(a: A) -> A {
  return a;
}

operator infix |> {
  associativity left
}
operator infix ▹ {
  associativity left
}
//operator infix <| {}
//operator infix ◃ {}

// Thrush
func |><A, B>(a: A, f: A -> B) -> B {
  return f(a)
}

func ▹<A, B>(a: A, f: A -> B) -> B {
  return f(a)
}

// Unsafe tap
// Warning: Unstable rdar://17109199
//func unsafeTap<A>(a: A, f: A -> Any) -> A {
//  f(a)
//  return a
//}
//
//func <|<A>(a: A, f: A -> Any) -> A {
//  f(a)
//  return a
//}
//
//func ◃<A>(a: A, f: A -> Any) -> A {
//  f(a)
//  return a
//}


operator infix <^> {
  associativity left
}

operator infix <*> {
  associativity left
}

// Optional

func pure<A>(a: A) -> A? {
  return a
}

func <^><A, B>(f: A -> B, a: A?) -> B? {
  if a {
    return (f(a!))
  } else {
    return .None
  }
}

func <*><A, B>(f: (A -> B)?, a: A?) -> B? {
  if f && a {
    return (f!(a!))
  } else {
    return .None
  }
}

// the "if the arg is Some, apply the function that returns an optional
// value and if the arg is None, just return None" function.
func >>=<A, B>(a: A?, f: A -> B?) -> B? {
  if a {
    return f(a!)
  } else {
    return .None
  }
}

// array

func pure<A>(a: A) -> Array<A> {
  var v = Array<A>()
  v.append(a)
  return v
}

func <^><A, B>(f: A -> B, a: Array<A>) -> Array<B> {
  return a.map(f)
}

func <*><A, B>(f: Array<A -> B>, a: Array<A>) -> Array<B> {
  var re = Array<B>()
  f.map { (g: A -> B) in
    a.map {
      re.append(g($0))
    }
  }
  return re
}

func >>=<A, B>(a: Array<A>, f: A -> Array<B>) -> Array<B> {
  var re = Array<B>()
  for x in a {
    re.extend(f(x))
  }
  return re
}
