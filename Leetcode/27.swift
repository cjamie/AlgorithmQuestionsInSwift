/*
 Algorithm1:
    1. iterate through the collection, and only assign in-place values if we have number that is not val.
 CAUTION: original array may end up containing val at indexes beyond the range of k, but leetcode does not care.
 example:
    nums = [3,2,1,3,3], val = 3
    returnNums = [2,1,1,3,3] ---> leetcode will only see that its count is k, and the returned array is [2,1]
 
 Algorithm2:
    1. if the array is empty, exit out early and return 0 (since we are accessing via subscript)
    2. create an index counter to keep track of index, this will stop when we've reached nums.count (which can shrink due to the .remove function
        -if the current value matches val fromn function
            - remove the value at that index. this will also decrement the nums.count by 1
        -otherwise, increment the index.
    3. return the final nums count at the end.
 */
private extension Int {
    mutating func increment()-> Int {
        self += 1
        return self
    }
}

class Solution {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0
        
        nums.forEach {
            guard $0 != val else { return }
            nums[k] = $0
            k += 1
        }
        
        return k
    }
    
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var index = 0
        
        var isNotAtEnd: Bool {
            return index < nums.count
        }
        
        while isNotAtEnd {
            let currentNum = nums[index]
            currentNum == val
                ? nums.remove(at: index)
                : index.increment()
        }
        return nums.count
    }
}
