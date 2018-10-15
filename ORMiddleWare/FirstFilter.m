//
//  FirstFilter.m
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/15.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import "FirstFilter.h"

@implementation FirstFilter

- (void)invoke:(id)context next:(NoneParamBlock)next{
    NSLog(@"first filter doing work with context: %@", context);
    //执行权移交
    next();
    NSLog(@"first filter doing cleanup with context: %@", context);
}

@end
