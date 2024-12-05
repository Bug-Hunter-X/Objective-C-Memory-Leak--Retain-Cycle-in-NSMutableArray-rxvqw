In Objective-C, a common yet subtle error arises when dealing with memory management, specifically with regards to retaining and releasing objects.  Consider the scenario where you have a custom class, `MyObject`, and you're adding it to an array: 
```objectivec
NSMutableArray *myArray = [NSMutableArray array];
MyObject *myObject = [[MyObject alloc] init];
[myArray addObject:myObject];
```
The `addObject:` method performs a `retain` on `myObject`. If you don't explicitly `release` `myObject` or `autorelease` it earlier, then you have created a retain cycle.  When `myArray` is deallocated, `myObject` won't be deallocated because of the retain count from the array.  This leads to memory leaks.