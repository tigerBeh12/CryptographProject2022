//
//  ExtendedDigest.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

public protocol ExtendedDigest : Digest
{
    func getByteLength() -> Int
}
