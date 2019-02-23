import Foundation
/*
 
 Algorithm
    1. start from the end of the integer and reconstruct the integer from right to left.
    example: 17848667375
            - 5
            - 57
            - 573
            - 5737
            - 57376 (etc...)
            -( this value is stored and updated in revCounter )
    2. return true if it matches the input
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {return false}
        var temp = x
        var revCounter = 0
        
        while temp != 0 {
            let remainder = temp % 10
            revCounter = revCounter * 10 + remainder
            temp /= 10
        }
        return x == revCounter
    }
}
