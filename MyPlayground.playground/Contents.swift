//: Playground - noun: a place where people can play

import UIKit
import AppFrameWork


// MARK -- solution 1

//import SocketSwift
//let client = try Socket(.inet, type: .stream, protocol: .tcp) // create client socket
//try client.connect(port: 8080) // connect to localhost:8090
//
//var buffer = [UInt8](repeating: 0, count: 1024) // allocate buffer
//let numberOfReadBytes = try client.read(&buffer, size: 1024)
//
//if let string = String(bytes: buffer, encoding: String.Encoding.utf8){
//    print(string)
//} else {
//    print("not a valid UTF-8 sequence")
//}
//client.close()


// MARK -- solution 2

import SwiftSocket
let client2 = TCPClient(address: "localhost", port: 8080)
switch client2.connect(timeout: 10) {
    case .success:
        if let data = client2.read(1024)  {
            if let response = String(bytes: data, encoding: .utf8) {
                print(response)
            }else {
                print("here")
            }
        }else {
            print("empty data")
        }


    case .failure(let error):
        print("fail")
}
client2.close()

