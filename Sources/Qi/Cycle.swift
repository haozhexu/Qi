//
//  Cycle.swift
//  
//
//  Created by Haozhe XU on 22/4/2023.
//

/// 生剋
public protocol Cycle {

    associatedtype T

    func generate() -> T
    func restrain() -> T
}
