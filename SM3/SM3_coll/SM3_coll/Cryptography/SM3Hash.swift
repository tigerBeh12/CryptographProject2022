//
//  SM3Hash.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

public class Hash
{
    var digest:Digest
    
    init()
    {
        digest = SM3Digest()
    }
    
    public func generateHash(from message:[UInt8],to hash:inout [UInt8])
    {
        generateHash(from: message, inOff: 0, len: message.count, hash: &hash, outOff: 0)
    }
    
    public func generateHash(from message:[UInt8],inOff:Int,len:Int,hash:inout [UInt8],outOff:Int)
    {
        digest.update(inbytes: message, inOff: inOff, inLen: len)
        _ = digest.finalStep(outbytes: &hash, outOff: outOff)
    }
}
