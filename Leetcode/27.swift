/*
 Algorithm:
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
