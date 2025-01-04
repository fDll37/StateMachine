final class KMP {
    
    var piTable: [Int] = []
    
    func createPi(pattern: String) {
        piTable = Array(repeating: 0, count: pattern.count + 1)
        piTable[0] = 0
        piTable[1] = 0
        
        for q in 1..<pattern.count {
            var len = piTable[q]
            
            while len > 0 && pattern[len] != pattern[q] {
                len = piTable[len]
            }
            
            if pattern[len] == pattern[q] {
                len += 1
            }
            
            piTable[q + 1] = len
        }
    }
}
