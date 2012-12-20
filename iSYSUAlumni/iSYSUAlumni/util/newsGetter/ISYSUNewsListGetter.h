
#import <Foundation/Foundation.h>

#import "ISYSUProtocols.h"
#import "InfoHunter.h"
#import "IHURLConnection.h"


@interface ISYSUNewsListGetter : NSObject<IHURLConnectionDelegate,InfoHunterDelegate>{
	id<ISYSUGetterDelegate> _delegate;
	IHURLConnection *_connectionPtr;
	InfoHunter *_hunterPtr;
    NSInteger _newstype;
    
}

+ (id) getterWithDelegate:(id<ISYSUGetterDelegate>)delegate withType:(NSInteger)type;

- (void) cancel;

@end
