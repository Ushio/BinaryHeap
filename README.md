Best Simple Binary Heap Implementation

zlib License


```swift

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

print>
2
3
4
5
6

```