
/*	
 *	InfoHunter Framework
 *	Author: 张明锐(Mingrui Zhang)
 *	Email:	zhmingrui@gmail.com
 */

#import <Foundation/Foundation.h>


@class InfoHunter;
@protocol InfoHunterDelegate
- (void) hunter:(InfoHunter*)hunter finishedWithResult:(NSMutableDictionary*)dict;
@end

@interface InfoHunter : NSObject {
	NSString *_string;
	NSString *_language;
	id<InfoHunterDelegate> _delegate;
	NSThread *_threadPtr;
	NSMutableDictionary *_result;
}

//synchronous version
+ (NSMutableDictionary*) parseString:(NSString*)string withLanguage:(NSString*)language;

//asynchronous version
+ (InfoHunter*) hunterWithString:(NSString*)string language:(NSString*)language delegate:(id<InfoHunterDelegate>)delegate;
- (void) cancel;

@end
