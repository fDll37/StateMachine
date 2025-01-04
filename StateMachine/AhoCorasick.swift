final class AhoCorasick {
    private var root: Node

    init(patterns: [String]) {
        self.root = Node()
        for pattern in patterns {
            addPattern(value: pattern)
        }
        buildLinks()
    }
    
    private func addPattern(value: String) {
        var node = root
        for char in value {
            if !node.child.keys.contains(char) {
                node.child[char] = Node(prefix: node.prefix + String(char))
            }
            node = node.child[char]!
        }
        node.isFinal = true
    }
    
    private func buildLinks() {
        let queue = Queue<Node>()
        root.child.values.forEach { node in
            queue.enqueue(node)
            node.suffixLink = root
        }
        
        while !queue.isEmpty {
            guard let node = queue.dequeue() else { continue }
            
            for char in node.child.keys {
                let child = node.child[char]!
                queue.enqueue(child)
                
                var suffixLink = node.suffixLink
                while suffixLink != nil && suffixLink?.child[char] == nil {
                    suffixLink = suffixLink?.suffixLink
                }
                
                if let suffixLink = suffixLink {
                    child.suffixLink = suffixLink.child[char]
                } else {
                    child.suffixLink = root
                }
                
                if child.suffixLink?.isFinal == true {
                    child.finalsLink = child.suffixLink
                } else {
                    child.finalsLink = child.suffixLink?.finalsLink
                }
            }
        }
    }
    
    func findMatches(text: String) -> [String] {
        var matches = [String]()
        var node: Node? = root
        
        for char in text {
            while node != nil && node?.child[char] == nil {
                node = node?.suffixLink
            }
            
            if node == nil {
                node = root
                continue
            }
            
            node = node?.child[char]
            var finals = node
            
            while let finalNode = finals, finalNode.isFinal {
                matches.append(finalNode.prefix)
                finals = finalNode.finalsLink
            }
        }
        
        return matches
    }
}
