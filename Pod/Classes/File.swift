//
//  File.swift
//  Bytes
//
//  Created by Rasmus Kildevæld   on 03/08/15.
//  Copyright © 2015 Rasmus Kildevæld  . All rights reserved.
//

import Darwin

public protocol File {
    var path: String { get }
    var fileDescriptor: Int32? { get }
    var size: Int { get }
    func close()
}

public struct FileStat {
    public let size: Int
    
}

extension File {
    public var stats: FileStat? {
        let buf = UnsafeMutablePointer<Darwin.stat>()
        fstat(self.fileDescriptor!, buf);
        
        
        let stat = FileStat(size:self.size)
        free(buf)
        return stat
    }
}
