import Foundation

/*
    Algorithm:
 1. iterate through the nums array provided, and store each index into a dictionary
    - Key is the complement (target - value at current num element
    - value is the index
 2. as you go through, check to see if the complement (desired solution) is present inside of your solution. If it is present, and the temp and i are not matching indexes, return. otherwise, add and new entry into dictionary and continue on.
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        
        for i in stride(from: 0, to: nums.count, by: 1) {
            
            if let temp = dict[target - nums[i]], temp != i {
                return [temp,i]
            }
            
            dict[nums[i]] = i
        }
        return [0,0]
    }
    
    // same thing, expressed with functional twist.
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var cache: [Int: Int] = [:]
        var anx = 0
        let other = nums.enumerated().first(where: {
            if let temp = cache[target - $1] {
                anx = temp
                return true
            } else {
                cache[$1] = $0
                return false
            }
        })!.offset
        print(cache)
        return [ anx, other ]
    }
}
