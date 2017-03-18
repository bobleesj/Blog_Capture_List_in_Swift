/*: 
 
## Swift Capture List in Closures
Full tutotiral originally published on [Medium] by Bob Lee
 - Last Update on March 18, 2017
 - Swift 3 & iOS 10

[Medium]: https://medium.com/ios-geek-community/intro-to-swift-functional-programming-with-bob-9c503ca14f13#.x47hcc2mn
*/
//: Closure Reference Type
var a = 0
var b = 0

let newClosure: () -> () = { print(a, b) }


let closure = { print(a, b) }
closure()

a = 6
b = 9
closure()

//: Problem
var closureArray: [() -> ()] = []
var i = 0

for _ in 1...5 {
  closureArray.append {
    print(i)
  }
  i += 1
}

closureArray[0]() // 5 😲
closureArray[1]() // 5 🤔
closureArray[2]() // 5 😨
closureArray[3]() // 5 😭
closureArray[4]() // 5 😱

//: Don't Reference, Copy
var c = 0
var d = 0

//let smartClosure: () -> () = { _ in
//  print(c, d)
//}

let smartClosure: () -> () = { [c, d] in
  print(c, d)
}

smartClosure()

//: Solve the Problem
var smartClosureArray: [() -> ()] = []
var j = 0

for _ in 1...5 {
  smartClosureArray.append { [num = j] in
    print(num)
  }
  j += 1
}

smartClosureArray[0]() // 1 ☝️
smartClosureArray[1]() // 2 💪
smartClosureArray[2]() // 3 🎁
smartClosureArray[3]() // 4 🎉
smartClosureArray[4]() // 5 🎅





// The self expression is an explicit reference to the current type or instance of the type in which it occurs. It has the following forms:


String.self
a.self
// The first form evaluates to the value of the expression. For example, x.self evaluates to x.

// The second form evaluates to the value of the type. Use this form to access a type as a value. For example, because SomeClass.self evaluates to the SomeClass type itself, you can pass it to a function or method that accepts a type-level argument.

print(closure.self)
Int.self








/*:
> Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://bobleesj.gitbooks.io/bob-s-learning-journey/content/WORK.html)
*/

