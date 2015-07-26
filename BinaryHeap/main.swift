//
//  main.swift
//  BinaryHeap
//
//  Created by Ushio on 2015/07/26.
//  Copyright © 2015年 Ushio. All rights reserved.
//

import Foundation

struct BinaryHeap<T: Comparable> {
    private var _heap = [T]()
    
    init() {
        
    }
    mutating func reserveCapacity(n: Int) {
        _heap.reserveCapacity(n)
    }
    mutating func push(value: T) {
        _heap.append(value)
        self.upheap()
    }
    private mutating func upheap() {
        var s = _heap.count
        var p = s >> 1
        while 0 < p && _heap[s - 1] < _heap[p - 1] {
            swap(&_heap[s - 1], &_heap[p - 1])
            s = p
            p = s >> 1
        }
    }
    mutating func pop() {
        if _heap.count == 0 {
            return
        }
        _heap[0] = _heap[_heap.count - 1]
        _heap.removeLast()
        self.downheap()
    }
    private mutating func downheap() {
        var s = 1
        var l = s << 1
        var r = l + 1
        while true {
            if _heap.count < l {
                break
            }
            
            // 右の子が存在していて、かつ右の方が小さいならば、右と交換する
            var c = l
            if r <= _heap.count && _heap[r - 1] < _heap[l - 1] {
                c = r
            }
            
            // 正しい順序である
            if _heap[s - 1] <= _heap[c - 1] {
                break
            }
            
            // 順序を正す
            swap(&_heap[s - 1], &_heap[c - 1])
            
            s = c
            l = s << 1
            r = l + 1
        }
    }
    var top: T? {
        return _heap.first
    }
    mutating func increaseTop(value: T) {
        if _heap.count == 0 {
            return
        }
        _heap[0] = value
        self.downheap()
    }
}

// quick check
for _ in 0..<10000 {
    var heap = BinaryHeap<Int>()
    var array_a = [Int]()
    for _ in 0..<100 {
        let v = Int(arc4random())
        
        heap.push(v)
        array_a.append(v)
    }
    
    heap.increaseTop(Int.max)
    
    array_a.sortInPlace()
    array_a[0] = Int.max
    array_a.sortInPlace()
    
    var array_b = [Int]()
    while let top = heap.top {
        array_b.append(top)
        heap.pop()
    }
    assert(array_a == array_b)
}

var heap = BinaryHeap<Int>()
heap.push(5)
heap.push(2)
heap.push(3)
heap.push(0)
heap.push(4)

heap.increaseTop(6)

while let top = heap.top {
    print(top)
    heap.pop()
}


