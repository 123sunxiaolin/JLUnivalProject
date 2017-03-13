//
//  JLNavigationHandler.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "JLNavigationHandler.h"
#import "JLNavigationAnimator.h"

@interface JLNavigationHandler()<UIGestureRecognizerDelegate, JLNavigationAnimatorDelegate>
/**
 *  私有导航类对象
 */
@property (nonatomic, strong) UINavigationController *navigationController;
/**
 *  负责动画、交互的类(the custom animation between the disappearance of one view controller and the appearance of another)
 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interaction;
/**
 *  处理自定义动画对象
 */
@property (nonatomic, strong) JLNavigationAnimator *animator;
/**
 *  执行pop动画的渐变色图层
 */
@property (nonatomic, strong) CAGradientLayer *uiPopShadowLayer;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation JLNavigationHandler

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController{
    self = [super init];
    if (self) {
        _recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        _recognizer.delegate = self;
        _recognizer.delaysTouchesBegan = NO;
        [navigationController.view addGestureRecognizer:_recognizer];
        
        /**
         *  暂时不知道具体作用
         */
        self.animator = [[JLNavigationAnimator alloc] init];
        self.animator.animatorDelegate = self;
        _navigationController = navigationController;
    }
    return self;
}

#pragma mark - getters
- (CAGradientLayer *)uiPopShadowLayer{
    if (!_uiPopShadowLayer) {
        _uiPopShadowLayer = [CAGradientLayer layer];
        _uiPopShadowLayer.frame = CGRectMake(-6, 0, 6, CGRectGetHeight(self.navigationController.view.frame));
        _uiPopShadowLayer.startPoint = CGPointMake(1.0, 0.5);
        _uiPopShadowLayer.endPoint = CGPointMake(0, 0.5);
        _uiPopShadowLayer.colors = @[(id)[UIColor colorWithWhite:0 alpha:.2].CGColor, (id)[UIColor clearColor].CGColor];
    }
    return _uiPopShadowLayer;
}

#pragma mark - Gesture Action
- (void)pan:(UIPanGestureRecognizer *)recognizer{
    UIView *view = recognizer.view;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            CGPoint point = [recognizer locationInView:view];
            if (point.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1 ) {
                //左侧 一半范围内
                self.interaction = [[UIPercentDrivenInteractiveTransition alloc] init];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
            break;
        case UIGestureRecognizerStateChanged:{
            
            CGPoint transition = [recognizer locationInView:view];
            CGFloat percent = transition.x / CGRectGetWidth(view.frame);
            [self.interaction updateInteractiveTransition:percent];
        }
            break;
            case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            if ([recognizer locationInView:view].x > CGRectGetWidth(view.frame) * 0.5) {
                [self.interaction finishInteractiveTransition];
            }else{
                [self.interaction cancelInteractiveTransition];
            }
            self.interaction = nil;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    return self.interaction;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        [fromVC.view.layer addSublayer:self.uiPopShadowLayer];
    }
    return self.animator;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if(self.isAnimating){
        return NO;
    }
    UIView *view = gestureRecognizer.view;
    CGPoint point = [gestureRecognizer locationInView:view];
    return point.x < 44.f;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return [otherGestureRecognizer.view.superview isKindOfClass:[UITableView class]];
}

#pragma mark - JLNavigationAnimatorDelegate
- (void)animateWillStart:(JLNavigationAnimator *)animator{
    self.isAnimating = YES;
}

- (void)animateDidEnd:(JLNavigationAnimator *)animator{
    self.isAnimating = NO;
}

@end
