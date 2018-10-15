//
//  ORMiddleWare.h
//  ORMiddleWare
//
//  Created by mathewwang on 2018/10/12.
//  Copyright © 2018年 oriente. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NoneParamBlock)(void);

@interface ORMiddleWare : NSObject

/**
 *
 */
- (void)invoke:(id) context next:(NoneParamBlock) next;


/**
 *
 */
- (void (^)(id context, void(^next)(void)))run;

@end
