//
//  JLNavigationHandler.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "JLNavigationHandler.h"
#import "JLNavigationAnimator.h"

@interface JLNavigationHandler()<UIGestureRecognizerDelegate>
/**
 *  私有导航类对象
 */
@property (nonatomic, strong) UINavigationController *navigationController;
/**
 *  负责动画、交互的类
 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interaction;
/**
 *  处理自定义动画对象
 */
@property (nonatomic, strong) JLNavigationAnimator *animator;

@end

@implementation JLNavigationHandler
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if (self) {
        _navigationController = navigationController;
    }
    return self;
}
@end
