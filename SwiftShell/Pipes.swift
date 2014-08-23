//
// Pipes.swift
// SwiftShell
//
// Created by Kåre Morstøl on 17/08/14.
// Copyright (c) 2014 NotTooBad Software. All rights reserved.
//


infix operator |> { precedence 50 associativity left }

public func |> <T,U>(lhs: T, rhs: T -> U) -> U {
	return rhs(lhs)
}

/* crashes the compiler (beta 6)
/**
    Sequence |>  (sorted, {<})  

  leads to

    sorted( Sequence, {<})
*/
public func |> <T,U,V>(lhs: T, rhs:((T,V) -> U, V)) -> U {
	return rhs.0(lhs, rhs.1 )
}
*/

/* crashes the compiler (beta 6)
/**
  Print one stream to another.
    readablestream |> writablestream
*/
public func |> <U>(lhs: Streamable, inout rhs: OutputStreamType) {
	// lhs.writeTo(&rhs)
	// rhs.write(lhs)
	print(lhs, &rhs)
}
*/

/* crashes the compiler (beta 6)
public func |> <U>(lhs: ReadableStreamType, inout rhs:  WriteableStreamType) {
	// lhs.writeTo(&rhs)
	// rhs.write(lhs)
	print(lhs, &rhs)
}
*/