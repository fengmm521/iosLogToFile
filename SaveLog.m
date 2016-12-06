//
//  SaveLog.m
//  JoymeVideoSDKDemo
//
//  Created by junpengzhang on 12/5/16.
//  Copyright © 2016 EF. All rights reserved.
//

#import "SaveLog.h"


@interface SaveLog()
{
    
    
}

@property (atomic, strong) NSString *logfilepath;
@property (atomic, strong) NSString *logstr;

@end

@implementation SaveLog
static SaveLog * shareSaveLog = NULL;

+(SaveLog *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareSaveLog = [[SaveLog alloc] init];
    });
    return shareSaveLog;
}

-(instancetype)init
{
    if (self = [super init]) {
        
        _logfilepath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        NSLog(@"%@",_logfilepath);
        
        NSString *logfilename = [_logfilepath stringByAppendingString:@"/log.txt"];
        _logfilepath = logfilename;
        _logstr = @"";
        
        
        NSFileManager *defaultManager = [NSFileManager defaultManager];
        [defaultManager removeItemAtPath:_logfilepath error:nil];
        
        freopen([_logfilepath cStringUsingEncoding:NSUTF8StringEncoding],"a+", stdout);
        freopen([_logfilepath cStringUsingEncoding:NSUTF8StringEncoding],"a+", stderr);
        
    }
    return self;
}


@end
