//
//  SYSUEngine.h
//  iSYSUAlumni
//
//  Created by again on 12/20/12.
//  Copyright (c) 2012 again. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocialControllerService.h"

@interface SYSUEngine : NSObject <UMSocialDataDelegate, UMSocialUIDelegate>
{
    UMSocialData *_socialData;
    UMSocialSnsType _selectOauthType;
}

+(SYSUEngine *)shareEngine;
-(void)login;//测试，只用weibo

@end
