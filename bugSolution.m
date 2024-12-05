To solve this, there are two primary approaches:

**1. Using `weak` properties (ARC):**
If you're using Automatic Reference Counting (ARC), declaring a `weak` property on the class helps: 
```objectivec
@interface MyObject : NSObject
@property (nonatomic, weak) NSMutableArray *parentArray; //Declare parentArray as weak
@end

@implementation MyObject
- (void)dealloc {
    NSLog (@"MyObject deallocated");
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *myArray = [NSMutableArray array];
    MyObject *myObject = [[MyObject alloc] init];
    myObject.parentArray = myArray;
    [myArray addObject:myObject];
    // myObject will now be deallocated properly
}
@end
```
This prevents a strong reference cycle.

**2. Manual Retain/Release (MRC):**
If you're not using ARC, then you must manually manage retain counts:
```objectivec
NSMutableArray *myArray = [[NSMutableArray alloc] init];
MyObject *myObject = [[MyObject alloc] init];
[myArray addObject:myObject];
[myObject release]; //Balance the retain from addObject
[myArray release]; //Release the array when done
```
This ensures that `myObject`'s retain count is correctly managed.  Note: In MRC, you usually need to use `autorelease` in other contexts for a more sophisticated memory management