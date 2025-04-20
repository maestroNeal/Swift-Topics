
//Manually creating threads can lead to several problems
//High Memory Usage & Thread Overhead
//Deadlocks etc

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ManualThread {
    func createThread() {
        let thread : Thread = Thread(target: self, selector: #selector(someMethod), object: nil)
        thread.start()
    }
    @objc func someMethod() {
        debugPrint("Manually creating threads")
    }
}
// MARK: GCD

//Execute code concurrently on multicore hardware by submitting work to dispatch queues managed by the system
//GCD is the Queue based api which allows to excutes closures on works pools in the first in first out order.
