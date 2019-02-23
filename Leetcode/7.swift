/*
 Algorithm:
    1. start from the end of x, and iterate from right to left to construct your reversed int.
        - get the mod, and add it to current, and multiply is by 10 in the next iteration
    2. if the accumulated retCounter is invalid (greater than 2^31), then return 0
        otherwise, check if the initial input was negative and apply its sign accordingly.
 
 */
private extension Int {
    var isNegative: Bool {
        return self < 0
    }
}

class Solution {
    
    private let javaIntMaxThatSwiftShouldNotCareAbout = 2147483648
    
    func reverse(_ x: Int) -> Int {
        var counter = abs(x)
        var retCount = 0
        
        while counter > 0 {
            retCount = retCount * 10 + counter % 10
            counter /= 10
        }
        
        return retCount < javaIntMaxThatSwiftShouldNotCareAbout
            ? x.isNegative
                ? -retCount
                : retCount
            : 0
    }
}
