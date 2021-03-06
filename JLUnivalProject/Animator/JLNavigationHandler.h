//
//  JLNavigationHandler.h
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JLNavigationHandler : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *recognizer;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
