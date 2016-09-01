//
//  ViewController.m
//  demo
//
//  Created by 赵博 on 16/9/1.
//  Copyright © 2016年 赵博. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _label.text = [NSString stringWithFormat:@"apple =%@,Language = %@",Localized(@"apple"),Localized(@"Language")];
    
    [_changeBtn setTitle:[NSString stringWithFormat:@"按钮 %@",Localized(@"Language")] forState:UIControlStateNormal];
    
    
}
- (IBAction)change:(id)sender {
    //IOS 8.0以后
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"语言切换" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //消息 随意发
        NSDictionary *passDic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"notif",nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:self userInfo:passDic];
        
        
        //修改本地获取的语言文件-交替
        NSString *language = [[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"];
        if ([language isEqualToString: @"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
        }else {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    //显示弹框
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
