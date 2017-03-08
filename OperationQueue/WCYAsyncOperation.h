//
//  WCYAsyncOperation.h
//  OperationQueue
//
//  Created by wangchangyang on 2017/3/8.
//  Copyright © 2017年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AsyncBlock)();
@interface WCYAsyncOperation : NSOperation

- (instancetype)initWithAsyncBlock:(AsyncBlock)block;

@end
