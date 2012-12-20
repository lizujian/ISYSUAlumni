//
//  SYSUEngine.m
//  iSYSUAlumni
//
//  Created by again on 12/20/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import "SYSUEngine.h"

@implementation SYSUEngine
static SYSUEngine *instance=nil;
+(SYSUEngine *)shareEngine
{
	@synchronized(self)
	{
		if (instance==nil) {
			instance=[[SYSUEngine alloc]init];
		}
	}
	return instance;
}

-(id)init
{
    self = [super init];
    if (self) {
        _socialData = [UMSocialData defaultData];
    }
    return self;
}
-(void)login
{
    ;
}
@end
