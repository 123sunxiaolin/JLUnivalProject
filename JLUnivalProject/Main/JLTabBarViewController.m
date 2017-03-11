//
//  JLTabBarViewController.m
//  JLUnivalProject
//
//  Created by Sunxiaolin on 17/3/11.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "JLTabBarViewController.h"
#import "JLAppDelegate.h"
#import "JLFIrstViewController.h"
#import "JLSecondViewController.h"
#import "JLThirdViewController.h"

static NSString * const TabBarVC = @"vc";
static NSString * const TabBarTitle = @"title";
static NSString * const TabBarImage = @"image";
static NSString * const TabBarSelectedImage = @"selectedImage";
static NSInteger  const TabBarCount = 3;

typedef NS_ENUM(NSInteger, JLTabItemType) {
    JLTabItemTypeFirst,
    JLTabItemTypeSecond,
    JLTabItemTypeThird
};

@interface JLTabBarViewController ()

@property (nonatomic, strong) NSDictionary *tabBarItemInfoDictionary;
@end

@implementation JLTabBarViewController

+ (instancetype)instance{
    JLAppDelegate *deleage = (JLAppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = deleage.window.rootViewController;
    if ([vc isKindOfClass:[JLTabBarViewController class]]) {
        return (JLTabBarViewController *)vc;
    }else{
        return nil;
    }
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //[self setUpNav];
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (NSArray *)tabBars{
    NSMutableArray *tabBarArray = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < TabBarCount; index ++) {
        [tabBarArray addObject:@(index)];
    }
    return tabBarArray;
}

- (void)setUpNav{
    
    //NSMutableArray *handlerArray = [[NSMutableArray alloc] init];
    NSMutableArray *vcMutableArray = [[NSMutableArray alloc] init];
    [self.tabBars enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *item = [self vcInfoWithItemType:[obj integerValue]];
        NSString *vcName = item[TabBarVC];
        NSString *title = item[TabBarTitle];
        NSString *imageName = item[TabBarImage];
        NSString *selectedImageName = item[TabBarSelectedImage];
        Class clazz = NSClassFromString(vcName);
        UIViewController *vc = [[clazz alloc] initWithNibName:nil bundle:nil];
        vc.title = title;
        vc.hidesBottomBarWhenPushed = NO;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav.tabBarItem.tag = idx;
        //添加pop手势
        [vcMutableArray addObject:nav];
    }];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateSelected];
    self.tabBarController.viewControllers = vcMutableArray;
    
}

- (NSDictionary *)vcInfoWithItemType:(JLTabItemType)type{
    if (!_tabBarItemInfoDictionary) {
        _tabBarItemInfoDictionary = @{
                                      @(JLTabItemTypeFirst)         : @{
                                              TabBarVC              : @"JLFIrstViewController",
                                              TabBarTitle           : @"Bike",
                                              TabBarImage           : @"tabbar_first_normal",
                                              TabBarSelectedImage   : @"tabbar_first_selected",
                                              },
                                      @(JLTabItemTypeSecond)        : @{
                                              TabBarVC              : @"JLSecondViewController",
                                              TabBarTitle           : @"Car",
                                              TabBarImage           : @"tabbar_second_normal",
                                              TabBarSelectedImage   : @"tabbar_second_selected",
                                              },
                                      @(JLTabItemTypeThird)         : @{
                                              TabBarVC              : @"JLThirdViewController",
                                              TabBarTitle           : @"Rocket",
                                              TabBarImage           : @"tabbar_third_normal",
                                              TabBarSelectedImage   : @"tabbar_third_selected",
                                              }
                                      };
    }
    return _tabBarItemInfoDictionary[@(type)];
}

@end
