//
//  main.m
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/12.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORCompose.h"
#import "FirstFilter.h"
#import "SecondFilter.h"
#import "ThirdFilter.h"


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
