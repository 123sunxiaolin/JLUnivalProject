//
//  JLNavigationAnimator.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "JLNavigationAnimator.h"

@implementation JLNavigationAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    //这个方法返回动画执行的时间
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewKey];
    /**
     *  创建转场动画执行的空间
     */
    UIView *containView = [transitionContext containerView];
    [containView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    /**
     *  执行动画，让fromViewControler移动到屏幕的最右侧
     */
    [UIView animateWithDuration:duration animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        /**
         *  当你的动画执行完成，这个方法必须要调用，否则系统会认为你的其余任何操作都在动画执行过程中。
         */
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

@end
