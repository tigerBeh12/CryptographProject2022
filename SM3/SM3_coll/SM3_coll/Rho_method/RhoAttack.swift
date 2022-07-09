//
//  RhoAttack.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/3.
//

import Foundation

public class Rho {
    
    public var reduced:Int
    public var collData:[[UInt8]]
    public var coll:([UInt8],[UInt8],[UInt8])?

    private var hashGenerate:Hash
    
    public init(reduced:Int){
        self.reduced = reduced
        self.collData = []
        self.coll = nil
        self.hashGenerate = Hash()
    }
    
    public func attack(){
        var arbitrary = [UInt8](repeating: 0, count: Int(arc4random() % 100) + 1)
        let status = SecRandomCopyBytes(kSecRandomDefault,arbitrary.count, &arbitrary)
        guard status == errSecSuccess else {
            return
        }
        collData.append(arbitrary)
        for _ in 1...Int64.max {
            var value:Array<UInt8> = Array<UInt8>(repeating:0,count:32)
            hashGenerate.generateHash(from: collData.last!, to: &value)
            let reducedHash:Array<UInt8> = Array<UInt8>(value.prefix(reduced))
            let find = collData.filter({ Array<UInt8>($0.prefix(reduced)) == reducedHash})
            if !find.isEmpty {
                let index = collData.firstIndex(of: find.first!)!
                guard index != 0 else{
                    return
                }
                coll = (collData[index-1],collData.last!,reducedHash)
                return
            }else{
                collData.append(value)
            }
        }
    }
    
}
