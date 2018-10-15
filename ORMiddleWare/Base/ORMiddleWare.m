//
//  ORMiddleWare.m
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/12.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import "ORMiddleWare.h"

@implementation ORMiddleWare

- (void (^)(id context, void (^next)(void)))run{
    return ^(id context, void (^next)(void)){
        [self invoke:context next:next];
    };
}

- (void)invoke:(id)context next:(NoneParamBlock)next{
    //should overwrite by subclass
}

@end
