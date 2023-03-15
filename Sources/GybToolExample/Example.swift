@main
struct Example {
    static func main() async throws {
        let examples: [any RawRepresentable] = [
            IntExample(0),
            Int8Example(0),
            Int16Example(0),
            Int32Example(0),
            Int64Example(0),
            UIntExample(0),
            UInt8Example(0),
            UInt16Example(0),
            UInt32Example(0),
            UInt64Example(0),
        ]
        
        for example in examples {
            print("\(type(of: example.rawValue)) - \(example.rawValue)")
        }
    }
}
