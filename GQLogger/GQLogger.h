//
//  GQLogger.h
//  Pods
//
//  Created by 林国强 on 16/6/21.
//
//

#import <Foundation/Foundation.h>
#import "GQLoggerSetting.h"
typedef void(^GQLoggerSettingBlock)(GQLoggerSetting *setting);

@interface GQLogger : NSObject

+ (instancetype)sharedInstance;

- (void)activeWithSetting:(GQLoggerSettingBlock) settingBlock;

- (void)stop;

- (void)showConsole;

- (void)closeConsole;

- (NSString *)logPath;

@end
