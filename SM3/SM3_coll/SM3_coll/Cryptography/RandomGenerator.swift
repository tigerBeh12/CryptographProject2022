//
//  RandomGenerator.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

public protocol RandomGenerator
{
    func addSeedMaterial(from seed: [UInt8])
    
    func addSeedMaterial(from seed: UInt64)
    
    func nextBytes(to bytes: inout [UInt8])
    
    func nextBytes(to bytes: inout [UInt8], start: Int, len: Int)
}

