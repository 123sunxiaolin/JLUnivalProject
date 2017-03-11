//
//  JLGlobalMacro.h
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#ifndef JLGlobalMacro_h
#define JLGlobalMacro_h


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
