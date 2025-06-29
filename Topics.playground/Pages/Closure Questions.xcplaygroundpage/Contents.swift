//MARK: Closure

//Q1: What is a closure in Swift?
//A closure is a self-contained block of code that can be passed around and used later. Closures can capture and store references to variables and constants from the surrounding context in which they are defined.
//
//Q2: How is a closure different from a function?
//Closures are similar to functions but are more lightweight and don't require a name. They can capture surrounding values, while functions cannot unless explicitly passed. Closures are often used for callbacks or inline operations.
//
//Q3: What is the syntax of a closure?
//swift
//Copy
//Edit
//let greet: () -> Void = {
//    print("Hello!")
//}
//Closures use {} instead of func. You define parameters and return types before the in keyword.
//
//Q4: Can closures accept parameters and return values?
//Yes, closures can take parameters and return values just like functions.
//
//swift
//Copy
//Edit
//let add: (Int, Int) -> Int = { a, b in
//    return a + b
//}
//Q5: Where are closures used in Swift?
//Closures are used in:
//
//Completion handlers (e.g., API calls)
//
//Higher-order functions like map, filter, reduce
//
//Event handling in SwiftUI or UIKit
//
//Custom reusable components
//
//Q6: What are trailing closures?
//A trailing closure is a closure passed as the final argument to a function, written outside the function's parentheses for readability.
//
//swift
//Copy
//Edit
//someFunction {
//   // This is a trailing closure
//}
//Q7: Example using closure in map/filter
//swift
//Copy
//Edit
//let numbers = [1, 2, 3, 4, 5]
//let filtered = numbers.filter { $0 > 2 }
//// Output: [3, 4, 5]
//Q8: What is the difference between escaping and non-escaping closures?
//A non-escaping closure is executed within the function body.
//An escaping closure is executed after the function returns (e.g., async tasks), so it's marked with @escaping.
//
//swift
//Copy
//Edit
//func fetchData(completion: @escaping () -> Void) {
//    DispatchQueue.main.async {
//        completion()
//    }
//}
//Q9: What does @escaping mean?
//@escaping means the closure "escapes" the function’s lifetime — it's stored and executed later. Common in async operations like API requests or delayed actions.
//
//Q10: What does it mean when a closure captures a value?
//Capturing means the closure keeps a reference to variables from its surrounding scope, even if that scope has ended.
//
//swift
//Copy
//Edit
//func makeCounter() -> () -> Int {
//    var count = 0
//    return {
//        count += 1
//        return count
//    }
//}
//Q11: How does Swift capture values — by value or reference?
//Swift captures:
//
//Value types (structs, enums) by copy (value)
//
//Reference types (classes) by reference
//
//Variables like var x = 10 are captured by reference if mutable
//
//Q13: Can you define a closure as a variable/property?
//swift
//Copy
//Edit
//var greet: (String) -> Void = { name in
//    print("Hello, \(name)!")
//}
//Q14: Can closures be used as function parameters?
//swift
//Copy
//Edit
//func performTask(completion: () -> Void) {
//    print("Doing something...")
//    completion()
//}
//Q15: What’s the difference between weak and unowned in closures?
//weak makes the captured reference optional (self?)
//
//unowned is non-optional, assumes self will never be nil
//
//Use weak when the captured object may deallocate
//
//Use unowned when you're sure the object will still exist
//
//Q16: How can closures cause memory leaks?
//If a closure captures self strongly inside a class, and the class holds the closure, it creates a retain cycle — neither can deallocate.
//
//Q17: How to avoid memory leaks in closures?
//Use a capture list with [weak self] or [unowned self] to prevent strong references:
//
//swift
//Copy
//Edit
//[weak self] in
//    self?.doSomething()
//Q18: What is a capture list in closures?
//Capture lists specify how to capture variables (weak, unowned):
//
//swift
//Copy
//Edit
//let closure = { [weak self, unowned delegate = self.delegate] in
//    self?.work()
//    delegate.doWork()
//}
//Q19: Difference between weak and unowned again (brief)
//weak    unowned
//Optional?    Yes (self?)    No (self)
//Can be nil?    Yes    No
//Used when?    Object might be nil    Object guaranteed to live
//
//Q20: How does Swift manage memory with closures?
//Swift uses ARC (Automatic Reference Counting) to manage memory.
//Closures that capture self strongly can cause memory leaks if not handled carefully — use [weak self].
//
//Q23: Real-life use case of closures
//In MVVM, I use closures for data binding between the ViewModel and ViewController.
//
//swift
//Copy
//Edit
//viewModel.onDataUpdate = { [weak self] in
//    self?.tableView.reloadData()
//}
//🧠 Closure Cheat Sheet for Interviews (💾 Save this)
//Concept    Summary
//Closure    A self-contained block of code that can capture surrounding values
//Syntax    { (params) -> ReturnType in code }
//Escaping closure    Runs after function returns → @escaping
//Non-escaping closure    Default. Runs within function
//Capture values    Closures keep references to outer variables
//Memory leaks    Caused by retain cycles (closure captures self)
//Fix retain cycles    Use [weak self] or [unowned self]
//Capture list    let closure = { [weak self] in ... }
//Use cases    API callbacks, data binding, animations, filters
//Trailing closures    Closure placed outside function call's parentheses
//ARC    Swift's memory manager (Automatic Reference Counting)
//
//Would you like me to turn this into a one-pager PDF or flashcards for easy revision?
//
//
//
//
//
//
//
//
//ChatGPT said:
//Absolutely Rahul — here's a comprehensive list of all possible interview questions on closures in Swift, organized by category and depth. This includes every angle interviewers might explore — syntax, memory, behavior, use cases, SwiftUI, and real-life scenarios.
//
//🧠 Conceptual Questions
//These check your understanding of what closures are:
//
//What is a closure in Swift?
//
//How is a closure different from a function?
//
//Can you explain the basic syntax of a closure?
//
//What are the types of closures in Swift?
//
//What does it mean for a closure to be a “first-class citizen” in Swift?
//
//What is the difference between escaping and non-escaping closures?
//
//What are trailing closures and why are they useful?
//
//🧪 Syntax & Usage Questions
//Test your ability to use closures in code:
//
//How do you define a closure that takes two Ints and returns their sum?
//
//How do you pass a closure as a function parameter?
//
//Can you return a closure from a function? Show an example.
//
//Can you define a closure property inside a class or struct?
//
//Show an example of using a closure with map, filter, and reduce.
//
//How can you use closures for sorting arrays?
//
//Can you create a closure without parameters and return type?
//
//Can closures be recursive? Show how.
//
//📦 Memory Management & Retain Cycle
//These questions dig into how closures interact with ARC:
//
//What does it mean when a closure captures a value?
//
//Do closures capture values by value or reference?
//
//How can closures cause retain cycles?
//
//How do you avoid memory leaks with closures?
//
//What is a capture list in Swift closures?
//
//What is the difference between [weak self] and [unowned self]?
//
//When would you use unowned instead of weak?
//
//Can a strong reference cycle occur if we forget to use [weak self]?
//
//⚙️ Practical / Real-World Usage
//These questions check how well you use closures in practice:
//
//How have you used closures in your projects?
//
//Can you show an example of using closures in MVVM for data binding?
//
//What are some common use cases of closures in UIKit?
//
//How are closures used in async operations like API calls?
//
//How would you pass a completion handler from a ViewModel to a ViewController?
//
//📱 Closures in SwiftUI
//SwiftUI uses closures heavily. Expect these if the job involves SwiftUI:
//
//How are closures used in SwiftUI components like Button, onTapGesture, etc.?
//
//How does SwiftUI use closures to manage user interaction?
//
//What’s the role of closures in SwiftUI animations?
//
//How does closure capturing behave inside SwiftUI views?
//
//🧬 Advanced Questions
//These are for senior or deep technical interviews:
//
//What are autoclosures in Swift? When are they used?
//
//What is a @convention(block) vs @convention(swift) in closures?
//
//How does closure memory management differ when capturing global, local, and class-level variables?
//
//How does Swift optimize closure capturing behind the scenes?
//
//Can closures be stored in collections? If yes, how?
//
//Can you assign a closure to a variable and use it multiple times?
//
//🎯 Scenario-Based / Debugging Questions
//You see a memory leak in your app. How would you check if it’s caused by a closure?
//
//A closure you wrote doesn't get called. What could be wrong?
//
//You used a weak reference in a closure and the block never executes. Why?
//
//When would you avoid using a closure and prefer delegation or Combine?
//
//What are the performance implications of excessive closure usage?
//
//🧩 Trick / Curveball Questions
//Sometimes used to test creativity:
//
//Can you use closures to implement your own event handling system?
//
//How would you create a closure that acts like a one-time trigger?
//
//Can a closure modify a captured let constant?
//
//Can a closure capture a value from another closure?
//
//How would you write a caching mechanism using closures?
//
//✅ Bonus — Quick Coding Challenges (closure-based)
//Write a function that takes an array and a closure to perform an action on each element.
//
//Create a counter function that uses a closure to keep track of how many times it's called.
//
//Use a closure to debounce an action (e.g., typing in a search bar).
//
//Simulate async operation with a closure-based completion handler.
