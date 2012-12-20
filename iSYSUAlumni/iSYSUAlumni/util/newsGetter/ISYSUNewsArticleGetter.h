
#import <Foundation/Foundation.h>

#import "ISYSUProtocols.h"
#import "InfoHunter.h"
#import "IHURLConnection.h"

@interface ISYSUNewsArticleGetter : NSObject<IHURLConnectionDelegate,InfoHunterDelegate>{
	NSString *__unsafe_unretained _articleID;
	id<ISYSUGetterDelegate> _delegate;
	IHURLConnection *_connectionPtr;
	InfoHunter *_hunterPtr;
    NSInteger _type;
}

@property(unsafe_unretained, nonatomic,readonly) NSString* articleID;

+ (id) getterWithArticleID:(NSString*)articleID delegate:(id<ISYSUGetterDelegate>)delegate newsType:(NSInteger)type;

- (void) cancel;

@end
