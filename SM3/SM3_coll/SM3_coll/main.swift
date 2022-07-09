//
//  main.swift
//  SM3_coll
//
//  Created by Beh Yang on 2022/7/2.
//

import Foundation

let problem:Bool = true
let reduced:Int = 7 //The whole length is 32 bytes(256 bits)

if problem {
    
    //MARK: -Birthday Attack
    print("Naive Birthday Attack...")
    let entity1:Birthday = Birthday(reduced: reduced)
    entity1.updateAttack(rationIndex: 20.0)
    if let coll = entity1.coll{
        print("One collision was found!The coll are as follows:")
        print("One preimage:\(coll.0)")
        print("The other preimage:\(coll.1)")
        print("SM3 Hash Value:\(coll.2)")
    }else{
        print("Failed of the \(reduced) bytes reduced attack, please try it again.")
    }
    
    
    
    //MARK: -Rho Method
    print("Rho Method Birthday Attack...")
    let entity2:Rho = Rho(reduced: reduced)
    entity2.attack()
    if let coll = entity2.coll{
        print("One collision was found!The coll are as follows:")
        print("One preimage:\(coll.0)")
        print("The other preimage:\(coll.1)")
        print("SM3 Hash Value:\(coll.2)")
    }else{
        print("Failed of the \(reduced) reduced attack, please try it again.")
    }
    
}else{
    
    
    // MARK: - Test the correctness of the result
    //The longest collision we find are as follows : message1 and message 2 are our preimage and their SM3 hash value collide at the 6 bytes prefix : [183, 110, 20, 205, 186, 77], 51 bits accurately.
    let message1:Array<UInt8> = [63, 122, 230, 120, 83, 201, 198, 65, 134, 139, 2, 244, 247, 206, 56, 186, 227, 47, 165, 253, 117, 249, 164, 17, 157, 82, 193, 17, 132, 228, 237, 8]
    let message2:Array<UInt8> = [209, 152, 200, 17, 162, 208, 249, 201, 199, 217, 200, 131, 240, 115, 59, 14, 169, 201, 189, 171, 212, 41, 164, 47, 19, 146, 223, 97, 199, 86, 28, 179]
    let hashGenerator:Hash = Hash()
    var value1:Array<UInt8> = Array<UInt8>(repeating:0,count:32)
    var value2:Array<UInt8> = Array<UInt8>(repeating:0,count:32)

    hashGenerator.generateHash(from: message1, to: &value1)
    hashGenerator.generateHash(from: message2, to: &value2)

    print(value1)
    print(value2)

}

print("over!")
