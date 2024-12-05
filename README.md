# Objective-C Memory Leak: Retain Cycle in NSMutableArray
This repository demonstrates a common Objective-C memory management issue involving retain cycles when using `NSMutableArray`. The `bug.m` file shows the problematic code, leading to a memory leak. The solution is provided in `bugSolution.m`.
## Problem
Adding objects to an `NSMutableArray` without proper memory management can create retain cycles. If an object added to the array also retains the array, neither will be deallocated, resulting in a memory leak.
## Solution
The solution employs `weak` properties or ensuring proper balancing of `retain` and `release` calls to break the retain cycle.  Consider using ARC (Automatic Reference Counting) to help prevent such issues, but you should still be aware of these scenarios.