//
//  JLFIrstViewController.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "JLFIrstViewController.h"
#import "JLSecondViewController.h"
#import "JLTestDirectionDelegate.h"

@interface JLFIrstViewController()<JLTestDelegate>
@property (nonatomic, strong) UIButton *testButton;
@end

@implementation JLFIrstViewController

#pragma mark - life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Jacklin";
    self.view.backgroundColor = [UIColor whiteColor] ;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.view addSubview:self.testButton];
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(200, 80));
    }];
}

#pragma mark - getters
- (UIButton *)testButton{
    if (!_testButton) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _testButton.backgroundColor = [UIColor blueColor];
        [_testButton setTitle:@"Test" forState:UIControlStateNormal];
        [_testButton addTarget:self
                        action:@selector(onClickTestButton:)
              forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _testButton;
}

#pragma mark - Action
- (void)onClickTestButton:(UIButton *)sender{
    /*JLSecondViewController *secondViewController = [[JLSecondViewController alloc] init];
    secondViewController.title = @"Second";
    [self.navigationController pushViewController:secondViewController animated:YES];*/
    JLTestDirectionDelegate *aDirection = [[JLTestDirectionDelegate alloc] init];
    aDirection.testDelegate = self;
}

#pragma mark - JLTestDelegate
- (void)testWithString:(NSString *)str{
    NSLog(@"test Str = %@", str);
}

- (NSArray *)backArray{
    return @[@"1", @"2"];
}

@end
