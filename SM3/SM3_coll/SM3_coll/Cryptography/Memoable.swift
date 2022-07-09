//
//  Memoable.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

public protocol Memoable
{
    func copy() -> Memoable
    
    func reset(from other:Memoable)
}
