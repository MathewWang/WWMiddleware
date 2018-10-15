//
//  ORCompose.h
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/12.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORMiddleWare.h"

@interface ORCompose : NSObject

+ (instancetype) compose:(NSArray<ORMiddleWare *> *) middleWare;

- (void (^)(id context, void (^next)(void)))run;

@end
