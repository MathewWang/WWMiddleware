# WWMiddleware
simple middleware implementation by OC

###非常简单的方式实现一个AOP的微框架，使用方式如下：

```
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [ORCompose compose:@[[FirstFilter new],
                             [SecondFilter new],
                             [ThirdFilter new]]]
        .run(@"context", ^{
            NSLog(@"doing business");
        });
    }
    return 0;
}

```
