//
//  ORCompose.m
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/12.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import "ORCompose.h"

@interface ORCompose()

@property (nonatomic, strong) NSArray<ORMiddleWare *> *middleWare;
@property (nonatomic, copy) NoneParamBlock(^dispatch)(NSInteger i);

@end

@implementation ORCompose

+ (instancetype)compose:(NSArray<ORMiddleWare *> *)middleWare{
    ORCompose *compose = [ORCompose new];
    compose.middleWare = middleWare;
    return compose;
}

- (void (^)(id context, void(^next)(void)))run{
    __weak typeof(self) weakSelf = self;
    return ^(id context, void (^next)(void)){
        __strong typeof(self) strongSelf = weakSelf;
        __block NSInteger index = -1;
        strongSelf.dispatch = ^NoneParamBlock(NSInteger i) {
            //一个middleware只能调用一次next
            if (i < index) { return ^{}; }
            
            index = i;
            __strong typeof(self) strongSelf = weakSelf;
            void (^fn)(id,void(^)(void)) = nil;
            if (i < strongSelf.middleWare.count) {
                fn = strongSelf.middleWare[i].run;
            }
            if (!fn) { return ^{}; }
            
            if (i == (strongSelf.middleWare.count - 1)) {
                //middleware都完成后调用业务代码
                return ^{  fn(context,next); };
            }else{
                //任意一个middleware的next就是下一个middleware
                return ^{ fn(context,strongSelf.dispatch(i+1)); };
            }
        };
        strongSelf.dispatch(0)();
    };
}


@end
