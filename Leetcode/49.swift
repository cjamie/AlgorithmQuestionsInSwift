import Foundation
/*
 
 algorithm:
 
 1: go through every string in the strs collection
    2. sort each individual element to a string, and use it as a key for a hashmap
        if it already exists, then append to existing array. otherwise, create a new array with that element as its only value
 3. change your hashmap to array of strings based on value (we don't care about the keys)
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var dict: [String: [String]] = [:]
        
        strs.forEach {
            let key = String($0.sorted())
            if var existing = dict[key] {
                existing.append($0)
                dict[key] = existing
            } else {
                dict[key] = [$0]
            }
        }
        return dict.map{$0.value}
    }
}
