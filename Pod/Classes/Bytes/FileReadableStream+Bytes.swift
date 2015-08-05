


import Darwin
import Bytes

extension ReadableFileStream: CollectionType {
    public typealias Generator = IndexingGenerator<ReadableFileStream>
    public typealias Element = UInt8
    public typealias Index = Int
    
    
    public var startIndex: Index {
        return 0
    }
    
    public var endIndex: Index {
        return self.count
    }
    
    /*public subscript(i: Index) -> UInt8 {
        get {
            return self.read(i)
        } set (value) {
            self[i] = value
        }
    }*/
    
    public func generate() -> Generator  {
        return IndexingGenerator(self)
    }
    
    
}

extension ReadableFileStream: ReadableBytesType {
    public func read(buffer: UnsafeMutablePointer<UInt8>, index: Int, to: Int) -> Int {
        let prev = self.tell
        self.seek(index, whence: .Start)
        let diff = to - index
        let ret = self.read(buffer, length: diff)
        self.seek(prev, whence: .Start)
        return ret
    }
    public func read(index: Int) -> UInt8 {
        self.read(index)!.first!
    }
    
    public func read(index: Int, to: Int) -> ReadableBytesSlice? {
        if to > self.size { return nil }
        
        let pos = SlicePosition(index: index, to:to)
        
        
        
    }
}

extension ReadableFileStream: Sliceable {
    public typealias SubSlice = Bytes
    
    public subscript(i: Range<Index>) -> ReadableBytesSlice? {
        let prev = self.tell
        self.seek(i.startIndex, whence: .Start)
        let diff = i.endIndex - i.startIndex
        let bytes = Bytes(count: diff)
        
        self.read(bytes.buffer, length: diff)
        self.seek(prev, whence: .Start)
        return bytes
    }
}