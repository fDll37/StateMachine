final class Auto {
    
    private let alphabet: String = "ABC"
    private var length: Int
    private var delta: [[Int]] = []
    
    init(pattern: String) {
        length = pattern.count
        createDelta(pattern: pattern)
    }
    
    func search(text: String) -> Int {
        var q = 0
        
        for i in 0..<text.count {
            q = delta[q][Int(text[i]!.asciiValue!) - Int(Character("A").asciiValue!)]
            if q == length {
                return i - length + 1
            }
        }
        
        return -1
    }
    
    private func createDelta(pattern: String) {
        delta = Array(repeating: Array(repeating: 0, count: alphabet.count), count: length + 1)
        
        for q in 0...length {
            
            for char in alphabet {
                var k = q + 1
                
                if q == length {
                    k -= 1
                }
                
                let line = String(pattern.prefix(q)) + String(char)
                while pattern.prefix(k) != line.suffix(k) {
                    k -= 1
                }
                
                delta[q][Int(char.asciiValue!) - Int(Character("A").asciiValue!)] = k
            }
        }
    }
    
}
