//
//  JLNavigationAnimator.h
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JLNavigationAnimator;
@protocol JLNavigationAnimatorDelegate <NSObject>
/**
 *  动画开始
 *
 *  @param animator 当前对象
 */
- (void)animateWillStart:(JLNavigationAnimator *)animator;
/**
 *  动画结束
 *
 *  @param animator 当前对象
 */
- (void)animateDidEnd:(JLNavigationAnimator *)animator;

@end

@interface JLNavigationAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<JLNavigationAnimatorDelegate> animatorDelegate;

@end
