//
//  SystemInfo.h
//  music
//
//  Created by again on 11/21/12.
//  Copyright (c) 2012 toraysoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

@interface SystemInfo : NSObject

+ (NSString *)osVersion;
+ (NSString *)appVersion;

+ (NSString *)deviceModel;
+ (NSString *)deviceUUID;

+ (BOOL)isJailBroken;
+ (NSString *)jailBreaker;

@end
