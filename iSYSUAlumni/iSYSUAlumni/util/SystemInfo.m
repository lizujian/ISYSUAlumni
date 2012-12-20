//
//  SystemInfo.m
//  music
//
//  Created by again on 11/21/12.
//  Copyright (c) 2012 toraysoft. All rights reserved.
//

#import "SystemInfo.h"

@implementation SystemInfo
+ (NSString *)osVersion
{
	return [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion];
}

+ (NSString *)appVersion
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)deviceModel
{
	return [UIDevice currentDevice].model;
}

+ (NSString *)deviceUUID
{
	return [UIDevice currentDevice].uniqueIdentifier;
}

static const char * __jb_app = NULL;

+ (BOOL)isJailBroken
{
	static const char * __jb_apps[] =
	{
		"/Application/Cydia.app",
		"/Application/limera1n.app",
		"/Application/greenpois0n.app",
		"/Application/blackra1n.app",
		"/Application/blacksn0w.app",
		"/Application/redsn0w.app",
		NULL
	};
    
	__jb_app = NULL;
    
	// method 1
    for ( int i = 0; __jb_apps[i]; ++i )
    {
        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
        {
			__jb_app = __jb_apps[i];
			return YES;
        }
    }
	
    // method 2
	if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
	{
		return YES;
	}
	
	// method 3
	if ( 0 == system("ls") )
	{
		return YES;
	}
	
    return NO;
}

+ (NSString *)jailBreaker
{
	if ( __jb_app )
	{
		return [NSString stringWithUTF8String:__jb_app];
	}
	else
	{
		return @"";
	}
}

@end
