import Foundation

// Find the most frequently occurring character in a given string

//func mostFrequentlyOccurringChar(in str: String) -> Character {
//
//    return "a"
//}
//func mostFrequentlyOccurringChar(in str: String) -> Character {
//    var dict = [Character : Int]()
//    var answer: Character?
//    var frequency: Int = 0
//
//    for char in str{
//        dict[char] = (dict[char] ?? 0) + 1
//    }
//    for (key,value) in dict{
//        if value > frequency{
//            frequency = value
//            answer = key
//        }
//    }
//
//    return answer!
//}

func mostFrequentlyOccurringChar(in str: String) -> Character {
    var dict = [Character : Int]()
    
    for char in str{
        dict[char] = (dict[char] ?? 0) + 1
    }
    
    let greatest = dict.max { a, b in a.value < b.value }
    
    let answer = greatest!
    
    return answer.key
}



// Find the first indicies whose values sum to a given number

//func pairSum(arr: [Int], target: Int) -> (Int, Int) {
//
//    return (0, 0)
//}

//func pairSum(arr: [Int], target: Int) -> (Int, Int) {
//
//
//          var hash: [Int : Int] = [:]
//
//          for (i, j) in nums.enumerated() {
//              if let index = hash[target - j]{
//                  return [index, i]
//              }
//              hash[j] = i
//
//          }
//          return [];
//
//    return (0, 0)
//}

func pairSum(arr: [Int], target: Int) -> (Int, Int) {
    
    var hash: [Int : Int] = [:]
    
    for (i, j) in arr.enumerated() {
        if let index = hash[target - j]{
            return (index, i)
        }
        hash[j] = i
    }
    return (0,1)
}


// Find the second most frequently occurring character in a given string

//func secondMostFrequentlyOccurringChar(in str: String) -> Character {
//}


func secondMostFrequentlyOccurringChar(in str: String) -> Character {
    var dict = [Character : Int]()
    
    for char in str{
        dict[char] = (dict[char] ?? 0) + 1
    }
    
    let greatest = dict.max { a, b in a.value < b.value }
    
    dict.removeValue(forKey: greatest!.key)
    
    let second = dict.max { a, b in a.value < b.value }
    
    let answer = second!
    
    return answer.key
}


// https://leetcode.com/problems/ransom-note/

// Given an arbitrary ransom note string and another string containing letters from all
// the magazines, write a function that will return true if the ransom note can be
// constructed from the magazines ; otherwise, it will return false.

// Each letter in the magazine string can only be used once in your ransom note.

// Submit to the leetcode link for more tests

//func canConstruct(note: String, from originalLetters: String) -> Bool {
//    return false
//}

func canConstruct(note: String, from originalLetters: String) -> Bool {
    var dict = [Character: Int]()
    for char in note{
        dict[char] = (dict[char] ?? 0) + 1
    }
    for char in originalLetters{
        if let count = dict[char]{
            if count > 1{
                dict[char] = count - 1
            }else{
                dict[char] = nil
            }
        }
    }
    return dict.count == 0
}

// Return whether or not an input array contains duplicates

//func containsDuplicates(arr: [Int]) -> Bool {
//
//    return false
//}

func containsDuplicates(arr: [Int]) -> Bool {
    guard !arr.isEmpty else {return false}
    
    var dict = [Int:Int]()
    
    for i in arr{
        dict[i] = (dict[i] ?? 0) + 1
    }
    
    for (_,value) in dict{
        if value > 1{
            return true
        }
    }
    
    return false
}


// Find all values that appear exactly once in a given array of Strings

//func uniqueValues(in arr: [String]) -> [String] {
//    return []
//}

func uniqueValues(in arr: [String]) -> [String] {
    guard !arr.isEmpty else{return []}
    
    var dict = [String: Int]()
    
    var answer = [String]()
    
    for i in arr{
        if dict[i] == nil{
            answer.append(i)
            dict[i] = 1
        }
    }
    return answer
}

// Sort a given array by how often each term appears

//func sortByFrequency(arr: [Int]) -> [Int] {
//    return []
//}

func sortByFrequency(arr: [Int]) -> [Int] {
    
    guard !arr.isEmpty else {return []}
    
    var dict = [Int:Int]()
    var answer = [Int]()
    
    
    //created frequency dictionary
    for i in arr{
        dict[i] = (dict[i] ?? 0) + 1
    }
    
    print(dict.count)
    
    //while dictionary is not empty
    while dict.count > 0 {
        
        var frequencyKey: Int?
        var frequency: Int = 0
        
        //find the largest
        for (key,value) in dict{
            if value > frequency{
                frequency = value
                frequencyKey = key
            }
        }
        
        let range = 1...frequency
        
        for _ in range{
        answer.append(frequencyKey!)
        }
        
        dict.removeValue(forKey: frequencyKey!)
        
        frequencyKey = nil
        frequency = 0
        
        print("After")
        print(dict.count)
        
    }
    
    return answer
    
}
