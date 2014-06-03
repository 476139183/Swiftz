Swiftz
======

Swiftz is a Swift library for functional programming.

It defines purely functional data structures and functions.

**Implemented:**

- `Control/Base` functions
- `Maybe<A>` with `Equatable` and `Comparable`
- `Num` typeclass
- `Semigroup<A>` and `Monoid<A>` with some instances

**Typechecks but currently impossible:**

- `Either<A, B>` with `Equatable`
- `List<A>`

**Note:**

The "currently impossible" data structures we think the language intends to support.

**Not realised:**

These abstractions require language features that Swift does not support yet.

- `Either<A, B>` crashes with `unimplemented IRGen feature! non-fixed multi-payload enum layout`. `rdar://17109392`
- `List<A>` by an enum crashes the compiler. `rdar://???`
- `List<A>` via a super class and 2 sub classes crashes with `unimplemented IRGen feature! non-fixed class layout`. `rdar://17109323`
- Functor, Applicative, Monad, Comonad. To enable these, a higher kind,
  C++ template-template, or Scala-like kind system is needed. `rdar://???`

**General notes:**

- `enum` should derive Equatable and Comparable if possible, similar to case classes in Scala. Or a deriving mechanic
  like generics should be present. `rdar://???`
