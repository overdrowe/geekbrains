import UIKit

struct Queue<T> {
    init(elements : [T]){
        self.elements = elements;
    };
    
    private var elements: [T] = []
    
    mutating func add(element: T) {
        elements.append(element)
    }
    mutating func next() -> T? {
        return elements.removeFirst()
    }
    
    
    subscript(index: Int) -> T? {
        return (index) > (elements.count - 1) ? nil : elements[index];
    }
    
    func doSomethingImportant(thing: (Int, Int) -> Void) {
        thing(0, 1);
    }
}

var queue : Queue<Int> = Queue(elements: [1,2,3,4,5]);

queue[5];

queue.add(element: 11);
queue[5];

queue[4];

func superFunction(a: Int, b: Int) -> Void {
    print("oh, hi Mark!");
}

queue.doSomethingImportant(thing: superFunction);
