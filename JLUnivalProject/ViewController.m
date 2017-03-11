//
//  ViewController.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "ViewController.h"
#import "JLGlobalMacro.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    void (^testBlock)() = ^{
        NSLog(@"test: %s", __func__);
    };
    dispatch_async_main_safe(testBlock)
    
    
}
- (void)onTestBlock:(void(^)())successBlock{
    if (successBlock) {
        successBlock();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
