final class Queue<T> {
    
    private var elements: [T] = []

    var count: Int { elements.count }
    var head: T? { elements.first }
    var tail: T? { elements.last }
    var isEmpty: Bool { elements.isEmpty }
    
    func enqueue(_ value: T) {
        elements.append(value)
    }
    
    func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
}


extension Queue: Sequence {
    func makeIterator() -> QueueIterator {
        QueueIterator(values: elements)
    }
    
    struct QueueIterator: IteratorProtocol {
        var values: [T]
        
        init(values: [T]) {
            self.values = values
        }
        
        mutating func next() -> T? {
            if let _ = values.first {
                let value = values.removeFirst()
                return value
            }
            return nil
        }
    }
}
