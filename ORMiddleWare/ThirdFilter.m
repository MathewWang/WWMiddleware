//
//  ThirdFilter.m
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/15.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import "ThirdFilter.h"

@implementation ThirdFilter

- (void)invoke:(id)context next:(NoneParamBlock)next{
    NSLog(@"third filter doing work with context: %@", context);
    //执行权移交
    next();
    NSLog(@"third filter doing cleanup with context: %@", context);
}

@end
