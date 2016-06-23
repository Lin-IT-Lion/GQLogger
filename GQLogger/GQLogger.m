//
//  GQLogger.m
//  Pods
//
//  Created by 林国强 on 16/6/21.
//
//

#import "GQLogger.h"
#import "LumberjackLauncher.h"
static GQLogger *sharedInstance;
@interface GQLogger()
@property (nonatomic, assign, getter = isActive)BOOL active;
@property (nonatomic, strong)GQLoggerSetting *setting;
@property (nonatomic, strong)DDFileLogger *fileLogger;
@end

@implementation GQLogger

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (sharedInstance != nil) {
        return sharedInstance;
    }
    if ((self = [super init])) {
    }
    return self;
}

- (GQLoggerSetting *)setting
{
    if (_setting == nil) {
        _setting = [[GQLoggerSetting alloc] init];
        _setting.errorColor = [UIColor redColor];
        _setting.warningColor = [UIColor yellowColor];
        _setting.infoColor = [UIColor greenColor];
        _setting.debugColor = [UIColor darkGrayColor];
        
    }
    return _setting;
}

- (DDFileLogger *)fileLogger
{
    if (_fileLogger == nil) {
        _fileLogger = [[DDFileLogger alloc] init];
        _fileLogger.maximumFileSize = 1024 * 1024;
        _fileLogger.rollingFrequency = 60 * 60;
        [[_fileLogger logFileManager] setMaximumNumberOfLogFiles:7];
    }
    return _fileLogger;
}

- (void)activeWithSetting:(GQLoggerSettingBlock)settingBlock
{
    if (self.isActive) {
        return;
    }
    self.active = YES;
    if (settingBlock) {
        settingBlock(self.setting);
    }
   
    [self activeLogger];
}

- (void)stop
{
    if (!self.isActive) {
        return;
    }
    self.active = NO;
    [LumberjackLauncher changeStandardLoggersLevel:DDLogLevelOff];
    [LumberjackLauncher changeAppConsoleLoggerLevel:DDLogLevelOff];
    [DDLog removeLogger:self.fileLogger];
    [DDLog addLogger:self.fileLogger withLevel:DDLogLevelOff];
    
}

- (void)showConsole
{
    [LumberjackLauncher showAppConsole];
}

- (void)closeConsole
{
    [LumberjackLauncher hideAppConsole];
}

- (NSString *)logPath
{
    return self.fileLogger.currentLogFileInfo.filePath;
}

- (void)activeLogger
{
    [LumberjackLauncher launchStandardLoggers];
    
    [LumberjackLauncher setXcodeConsoleLogColorsWithErrorColor:self.setting.errorColor
                                                  warningColor:self.setting.warningColor
                                                     infoColor:self.setting.infoColor
                                                    debugColor:self.setting.debugColor                                                  verboseColor:self.setting.verboseColor];
    
    DDLogLevel logLevel = DDLogLevelAll;
    [LumberjackLauncher changeStandardLoggersLevel:logLevel];
    [LumberjackLauncher changeAppConsoleLoggerLevel:logLevel];
    [DDLog removeLogger:self.fileLogger];
    [DDLog addLogger:self.fileLogger withLevel:logLevel];
}



@end
