//
//  WCYAsyncOperation.m
//  OperationQueue
//
//  Created by wangchangyang on 2017/3/8.
//  Copyright © 2017年 wangchangyang. All rights reserved.
//

#import "WCYAsyncOperation.h"

@interface WCYAsyncOperation()

@property (nonatomic, copy) AsyncBlock block;

@end


@implementation WCYAsyncOperation
@synthesize executing = _executing, finished = _finished;

- (instancetype)initWithAsyncBlock:(AsyncBlock)block {
    self = [super init];
    if (self) {
        _executing = NO;
        _finished = NO;
        _block = block;
    }
    return self;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    return _executing;
}

- (BOOL)isFinished {
    return _finished;
}

- (void)start {
    if (self.isCancelled) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main {
    @try {
        // 判断是否被取消
        if (self.isCancelled) {
            return;
        }
        // 执行所要执行的任务
        for (NSUInteger i = 0; i < 20; i++) {
            // 判断是否被取消
            if (self.isCancelled) {
                return;
            }
            NSLog(@"working:%@, thread:%@", @(i), [NSThread currentThread]);
            sleep(1);
        }
        NSLog(@"...1");
        
        [self willChangeValueForKey:@"isExecuting"];
        _executing = NO;
        [self didChangeValueForKey:@"isExecuting"];
        
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}


@end
