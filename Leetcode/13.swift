import Foundation

/*
 Algorithm:
    1. iterate through element in the string and add its associate int value for character key to the intCounter
        - if the current character counter turns out to be bigger than the previous counter, then decrement its previously added value twice, and add the new value
 - example: "MCMXCIV"
    [current] | [cumulative value]
    - M | +1000
    - C | +100
    - M | +1000 - 2*100  // M is bigger than C, so subtract 2*100 and add 1000
    - X | +10
    - C | +100 - 2*10
    - I | +1
    - V | +5 - 2*1
 
    2. of course, update your charCounter before you go to the next iteration.
 
 WARNING: this does not handle roman string validation, so you can give it something like MIMI and it will return a dummy value.
 */

class Solution {
    private enum RomanResource {
        static let greatestCharacter: Character = "M"
        static let romanDict: [Character: Int] = [
            "M": 1000,
            "D": 500,
            "C": 100,
            "L": 50,
            "X": 10,
            "V": 5,
            "I": 1
        ]
    }
    
    // same solution represented with functional programming
    func romanToInt(_ s: String) -> Int {
        var charCounter = RomanResource.greatestCharacter
        var intCounter = 0
        s.forEach { char in
            // if the current is smaller than previous
            let current = RomanResource.romanDict[char]!
            let previous = RomanResource.romanDict[charCounter]!
            
            if current > previous {
                intCounter = intCounter - 2 * previous + current
            } else {
                intCounter += current
                charCounter = char
            }
        }
        return intCounter
    }
    
    func romanToInt1(_ s: String) -> Int {
        var charCounter = RomanResource.greatestCharacter
        var intCounter = 0
        
        return s.reduce(0) {
            let current = RomanResource.romanDict[$1]!
            let previous = RomanResource.romanDict[charCounter]!
            
            if current > previous {
                return $0 - 2 * previous + current
            } else {
                charCounter = $1
                return $0 + current
            }
        }
    }
}
