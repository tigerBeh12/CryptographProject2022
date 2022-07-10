# Project Information

## Project
This folder contains the only one project for Bitcoin which is as follows:
- [Project](#Project):Send a tx on Bitcoin testate, and parse the tx data down to every bit, better write script yourself.

## Bitcoin Testnet
The testnet is an alternative Bitcoin block chain to be used for testing. Testnet coins are separate and distinct from actual bitcoins, and are never supposed to have any value. This allows application developers or bitcoin testers to experiment, without having to use real bitcoins or worrying about breaking the main bitcoin chain.You can get more information about it on [https://en.bitcoin.it/wiki/Testnet].


# Project Detail
For this part, we began with a Bitcoin address on testnet. The address we created form the website [bitaddress.org] is as follows:

## One collision(51 bits)
- [message1](#message)
    [239, 134, 147, 193, 120, 145, 25, 241, 254, 93, 111, 120, 123, 71, 78, 138, 100, 232, 207, 252, 165, 120, 16, 95, 98, 45, 156, 6, 139, 142, 42, 251]
- [message2](#message)
    [27, 65, 78, 110, 42, 230, 36, 191, 130, 99, 45, 0, 13, 250, 189, 146, 35, 76, 208, 138,  51, 216, 70, 75, 204, 137, 192, 72, 19, 62, 235, 195]
- [reduced(prefix 51) hash value](#coll)
    10110111 1101110 00010100 11001101 10111010 01001101 101

##Another collision(50 bits)
- [message1](#message)
    [63, 122, 230, 120, 83, 201, 198, 65, 134, 139, 2, 244, 247, 206, 56, 186, 227, 47, 165, 253, 117, 249, 164, 17, 157, 82, 193, 17, 132, 228, 237, 8]
- [message2](#message)
    [209, 152, 200, 17, 162, 208, 249, 201, 199, 217, 200, 131, 240, 115, 59, 14, 169, 201, 189, 171, 212, 41, 164, 47, 19, 146, 223, 97, 199, 86, 28, 179]
- [reduced(prefix 50) hash value](#coll)
    1001111 00011100 00110000 00000010 00110001 10100010 00

Notice:Message 1 and message 2 have the same length: 256 bits, which both are coded in an UInt8 array.



# Deployment Guide

## Guid

For this part, we use Swift to implement the above three projects, which as you see, are all contained in one Xcode project named "SM3_coll". If you want to
test this project in your own computer, you can download this folder and then drag SM3_coll.xcodeproj in your Xcode. If necessary, you should click "Trust and Open" for the next steps.

## Developers

Yang Kunyang

