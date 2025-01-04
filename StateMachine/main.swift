//let patterns = ["a", "as", "arab", "bar", "bass", "c", "car", "rab"]
//
//let aho = AhoCorasick(patterns: patterns)
//
//let text = "carabass barabass"
//
//let matches = aho.findMatches(text: text)
//print(matches)


let auto = Auto(pattern: "ABABC")
let x = auto.search(text: "AABABABABC")
print(x)

let kmp = KMP()
kmp.createPi(pattern: "ABABC")
print()
