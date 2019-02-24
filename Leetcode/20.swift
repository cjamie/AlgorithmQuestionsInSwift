/*
 Algorithm:
    1. made a makeshift stack data structure to better explain what we want.
    2. go through every character in the string
        - add the element if it does match the previous element's complement.
        - pop the last element if there is a match
        - edge case: if the stack is empty, there is nothing to compare, so just add whatever element
    3. at the end, confirm that the stack is empty to tell us whether or not string is valid
 
 note: can consider having a dictionary of first parenthesis to their complmement but believe we would compromise on clarity.
 */

private extension Character {
    var complement: Character? {
        switch self {
        case "(":
            return ")"
        case "{":
            return "}"
        case "[":
            return "]"
        default:
            return nil
        }
    }
}

class Solution {
    
    func isValid(_ s: String) -> Bool {
        
        var characterStack = Stack<Character>()
        
        s.forEach {
            guard !characterStack.isEmpty else {
                characterStack.push($0)
                return
            }
            characterStack.lastElement?.complement == $0
                ? characterStack.pop()
                : characterStack.push($0)
        }
        
        return characterStack.isEmpty
    }
    
    
    private struct Stack<T>{
        private var cheatArray: [T] = []
        
        mutating func push(_ newElement: T){
            cheatArray.append(newElement)
        }
        
        mutating func pop() {
            cheatArray.popLast()
        }
        
        var lastElement: T? {
            return cheatArray.last
        }
        var isEmpty: Bool {
            return cheatArray.isEmpty
        }
    }
}
