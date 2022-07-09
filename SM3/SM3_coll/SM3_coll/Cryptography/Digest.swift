//
//  Digest.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

public protocol Digest
{
    func getAlgorithmName() -> String
    func getDigestSize() -> Int
    func update(inbyte:UInt8)
    func update(inbytes:Array<UInt8>,inOff:Int,inLen:Int)
    func finalStep(outbytes:inout Array<UInt8>,outOff:Int) -> Int
    func reset()
}
