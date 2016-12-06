//
//  SaveLog.h
//  JoymeVideoSDKDemo
//
//  Created by junpengzhang on 12/5/16.
//  Copyright © 2016 EF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveLog : NSObject

//在Info.plist中加入UIFileSharingEnabled主键，并设置为YES.
//初始化当前对象之后，可以保存游戏运行log到app的Document目录，

+ (SaveLog *)sharedInstance;

@end
