//
//  ViewController.m
//  GQLoggerDemo
//
//  Created by 林国强 on 16/6/16.
//  Copyright © 2016年 林国强. All rights reserved.
//

#import "ViewController.h"
#import "GQLogger.h"
#import "DDLogMacros.h"
#import "GQSecretImageHandler.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[GQLogger sharedInstance] activeWithSetting:^(GQLoggerSetting *setting) {
        
    }];
    
    [[GQLogger sharedInstance] showConsole];
    DDLogInfo(@"info");
    DDLogError(@"error");
    DDLogWarn(@"warn");
    DDLogDebug(@"debug");
    DDLogVerbose(@"verbose");
    
    
    [[GQSecretImageHandler sharedInstance] activeWtihSetting:^(GQSecretImageModel *model) {
        NSString *logPath = [GQLogger sharedInstance].logPath;
        NSString *logString = [NSString stringWithContentsOfFile:logPath encoding:NSUTF8StringEncoding error:nil];
        model.secretImageText = logString;
        model.showInfoText = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
