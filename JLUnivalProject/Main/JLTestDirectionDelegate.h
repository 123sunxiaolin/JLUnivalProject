//
//  JLTestDirectionDelegate.h
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/12.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol JLTestDelegate <NSObject>

- (void)testWithString:(NSString *)str;

- (NSArray *)backArray;

@end

@interface JLTestDirectionDelegate : NSObject

@property (nonatomic, weak) id <JLTestDelegate> testDelegate;

- (void)startTest;

@end
