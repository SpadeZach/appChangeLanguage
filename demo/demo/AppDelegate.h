//
//  AppDelegate.h
//  demo
//
//  Created by 赵博 on 16/9/1.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

