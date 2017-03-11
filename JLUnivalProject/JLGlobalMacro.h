//
//  JLGlobalMacro.h
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#ifndef JLGlobalMacro_h
#define JLGlobalMacro_h

#pragma mark - ColorMacro

#define HexColor(rgb) HexColorFromRGBA(rgb, 1.0)

#define HexColorFromRGBA(rgb, alpha) [UIColor \
colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 \
green:((float)((rgb & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgb & 0x0000FF))/255.0 \
alpha:alpha]

#pragma mark - Main Thread 主线程

#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) { \
block();\
}else{ \
dispatch_sync(dispatch_get_main_queue(), block); \
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) { \
block();\
}else{ \
dispatch_async(dispatch_get_main_queue(), block); \
}

#define UserDefaults [NSUserDefaults standardUserDefaults]

#endif /* JLGlobalMacro_h */
