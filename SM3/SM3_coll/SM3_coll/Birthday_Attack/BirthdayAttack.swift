//
//  birthdayAttack.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/3.
//

import Foundation

public class Birthday {
    
    public var reduced:Int
    public var collData:[[UInt8]:[UInt8]]
    public var coll:([UInt8],[UInt8],[UInt8])?
    
    private var complexity:Int64
    private var hashGenerate:Hash
    
    public init(reduced:Int){
        self.reduced = reduced
        self.collData = [:]
        self.coll = nil
        self.complexity = Int64(pow(2,Double(reduced * 8 / 2)))
        self.hashGenerate = Hash()
    }
    
    public func attack(){
        for _ in 1...complexity {
            var preImage = Array<UInt8>(repeating: 0, count: 32)
            let _ = SecRandomCopyBytes(kSecRandomDefault, preImage.count, &preImage)
//            guard status == errSecSuccess else {
//                return
//            }
            var value:Array<UInt8> = Array<UInt8>(repeating:0,count:32)
            hashGenerate.generateHash(from: preImage, to: &value)
            let reducedHash:Array<UInt8> = Array<UInt8>(value.prefix(reduced))
            if !collData.keys.contains(reducedHash) {
                collData[reducedHash] = preImage
            }else{
                coll = (preImage,collData[reducedHash]!,reducedHash)
                return
            }
        }
    }
    
    public func updateAttack(rationIndex:Double){
        var value:Array<UInt8> = Array<UInt8>(repeating:0,count:32)
        let ratio = Int64(pow(2.0,rationIndex))
        for counter in 1...complexity {
            var preImage = Array<UInt8>(repeating: 0, count: Int(arc4random() % 100) + 1)
            let _ = SecRandomCopyBytes(kSecRandomDefault, preImage.count, &preImage)
//            guard status == errSecSuccess else {
//                return
//            }
            hashGenerate.generateHash(from: preImage, to: &value)
            let reducedHash:Array<UInt8> = Array<UInt8>(value.prefix(reduced))
            collData[preImage] = reducedHash
            if (counter % ratio == 0) {
                let result = Dictionary(grouping: collData.keys, by: { collData[$0]! })
                let find = result.filter({ $0.value.count > 1 })
                guard let first = find.first else {
                    continue
                }
                coll = (first.value[0],first.value[1],first.key)
                return
            }
        }
    }
    
}
