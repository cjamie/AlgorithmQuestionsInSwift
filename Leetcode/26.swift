/*
 Algorithm:
    1. we are accessing array via index-based system, so we should exit early if it is empty array
    2. create a counter that keeps track of where we are within the *solution* array.
        - if increment this counter if the current element does not match
            - also, update the array's element with the new value
 
 CAUTION: functional approach is not appropriate in this cause because we care a lot about the indexes.
 */

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var indexCounter = 0
        
        for i in stride(from: 1, to: nums.count , by: 1)
            where nums[i] != nums[indexCounter] {
            indexCounter += 1
            nums[indexCounter] = nums[i]
        }
        
        return indexCounter + 1
    }
}
