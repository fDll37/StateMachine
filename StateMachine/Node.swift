final class Node {
    
    var prefix: String
    var isFinal: Bool
    var suffixLink: Node?
    var finalsLink: Node?
    var child: [Character: Node] = [:]

    init(prefix: String = "") {
        self.prefix = prefix
        self.isFinal = false
    }
}
