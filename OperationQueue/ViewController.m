//
//  ViewController.m
//  OperationQueue
//
//  Created by wangchangyang on 2017/3/8.
//  Copyright © 2017年 wangchangyang. All rights reserved.
//

#import "ViewController.h"
#import "WCYAsyncOperation.h"

@interface ViewController ()

@property (nonatomic, strong) WCYAsyncOperation *op1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WCYAsyncOperation *op1 = [[WCYAsyncOperation alloc] initWithAsyncBlock:^{
        
    }];
    _op1 = op1;
}

- (IBAction)cancel:(id)sender {
    [_op1 cancel];
    NSLog(@"canceled");
}
- (IBAction)start:(id)sender {
    [_op1 start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
