
#import <Foundation/Foundation.h>


@protocol ISYSUGetterDelegate
@required
- (void) getterFailed:(id)getter;
- (void) getterSucceeded:(id)getter withInfo:(NSDictionary*)info;
@end