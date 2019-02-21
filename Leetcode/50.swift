import Foundation
/*
 algorithm:
 
 1: check to see if n (exponent) is less than 0, as we will calculate differently based on that
 2: if n is 0, simply return 1
    recursively call the helper function with n -> n/2
    account for odd powers by adding extra x term at the end.
 
 */
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return n < 0 ? 1/power(x,-n) : power(x,n)
    }
    
    // main function that does everything
    private func power(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        let v = power(x, n / 2)
        return v * v * (n % 2 == 0 ? 1 : x)
    }
}
