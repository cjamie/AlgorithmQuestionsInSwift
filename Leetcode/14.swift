/*
 Algorithm:
    1.create a helper extension that takes two strings, and returns a common prefix
    2.loop through all of the given strings (strs) and update strs.first until you have finished.
 
 TODO: find a more elegant and performant algorithm. 
 */
private extension String {
    func match(_ other: String) -> String {
        var counter = ""
        
        for charTuple in zip(self, other) {
            if charTuple.0 != charTuple.1 {
                return counter
            } else {
                counter.append(charTuple.0)
            }
        }
        return counter
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        return strs.reduce(strs.first ?? "") {
            $0.match($1)
        }
    }
}
