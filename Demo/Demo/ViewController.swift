//
//  ViewController.swift
//  Demo
//
//  Created by Chandresh on 17/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import UIKit
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    func isPalindrome() -> Bool {
        if self.count < 2 { return false }
        _ = lowercased()
        let strArray = Array(arrayLiteral: CharacterSet.init(charactersIn: self))
        var i = 0
        var j = strArray.count-1
        while i <= j {
            if strArray[i] != strArray[j] { return false }
            i+=1
            j-=1
        }
        return true
    }
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let arrDifference = getMinimumDifference(["a", "jk", "abb", "mn", "abc"], ["bb", "kj", "abc", "op", "def"])
        print("RESULT === > \(String(describing: arrDifference))")
        print("\(checkPalindrome("test"))")
    }
    
    //************** CHECK Difference between two Strings //
    
    func getMinimumDifference(_ a: [Any]?, _ b: [Any]?) -> [Int] {
        // Write your code here
        var result: [Any] = []
        for i in 0..<(a?.count ?? 0) {
            let arrObject = prepare(forArragrams: a?[i] as? String ?? "", secondString: b?[i] as? String ?? "")
            result.append(arrObject)
        }
        return result as? [Int] ?? []
    }
    
    func prepare(forArragrams a: String, secondString b: String) -> Int {
        if a.count != b.count {
            return -1
        } else if a == b {
            return 0
        }
        let aSet: NSCountedSet =  NSCountedSet.init(array: Array(a))
        let bSet: NSCountedSet = NSCountedSet.init(array: Array(b))
        let CSet: NSCountedSet = NSCountedSet.init(array: Array(a))
        
        aSet.minus(bSet as! Set<AnyHashable>)
        bSet.minus(CSet as! Set<AnyHashable>)
        var result = 0
        let array = bSet.allObjects
        for i in 0..<array.count {
            result += bSet.count(for: array[i])
        }
        return result
    }
    
    //************** COUNT Sub Strings Height //

    func checkEquality(s: String) -> Bool {
        if s.isEmpty {
            return false
        }
        return (s.substring(to: 0) == s.substring(to: s.count - 1))
    }
    
    func countSubstringWithEqualEnds(s: String) -> Int {
        var result = 0
        let n = s.count
        for i in 0...n-1 {
            for len in 1...n - i {
                if checkEquality(s: s.substring(with: i..<(i - 1) + len)) {
                    result += 1
                }
            }
        }
        return result
    }
    
    //************** CHECK Height //
    
    public func heightChecker(height: [Int]) -> Int {
        var count = 0
        let len = height.count - 1
        var newArray: [Int] = height
        newArray.sort()
        if height.count == 0 {
            return count
        }
        for i in 0...len {
            if (newArray[i] != height[i]) {
                count += 1
            }
        }
        return count
    }
    //************** CHECK PALINDROME //

    func isPalindrome(inputString: String) -> Bool {
        let stringLength = inputString.count
        var position = 0
        
        while position < stringLength / 2 {
            let startIndex = inputString.index(inputString.startIndex, offsetBy: position)
            let endIndex = inputString.index(inputString.endIndex, offsetBy: -position - 1)
            
            if inputString[startIndex] == inputString[endIndex] {
                position += 1
            } else {
                return false
            }
        }
        return true
    }
    // ADVANCE
    func checkPalindrome<T: StringProtocol>(_ word: T) -> Bool where T.Index == String.Index {
        let word = word.lowercased() .components(separatedBy: .punctuationCharacters).joined()
           .components(separatedBy: .whitespacesAndNewlines).joined()
        if word == "" || word.count == 1 {
            return true
        } else {
            if word.first == word.last {
                let start = word.index(word.startIndex,offsetBy: 1, limitedBy: word.endIndex) ?? word.startIndex
                let end = word.index(word.endIndex,offsetBy: -1, limitedBy: word.startIndex) ?? word.endIndex
                return checkPalindrome(word[start..<end])
            } else {
                return false
            }
        }
    }
}
