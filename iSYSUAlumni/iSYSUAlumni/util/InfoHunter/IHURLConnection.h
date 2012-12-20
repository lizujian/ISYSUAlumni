
/*	
 *	InfoHunter Framework
 *	Author: 张明锐(Mingrui Zhang)
 *	Email:	zhmingrui@gmail.com
 */

#import <Foundation/Foundation.h>

@class IHURLConnection;
@protocol IHURLConnectionDelegate
@required
- (void) connectionFailed:(IHURLConnection*)connection;
- (void) connection:(IHURLConnection*)connection finishedLoadingWithData:(NSData*)data;
@end


@interface IHURLConnection : NSObject {
	NSString *_urlString;
	id<IHURLConnectionDelegate> _delegate;
	NSURLConnection *_connectionPtr;
	NSMutableData *_data;
}

@property(readonly) NSString *urlString;
@property(readonly) NSData *data;

//CAUTION: urlString should be added percent escapes
//CAUTION: delegate won't be retained
//will delay the error reply with delegate methods, never return nil!
+ (id) connectionWithURLString:(NSString*)urlString delegate:(id<IHURLConnectionDelegate>)delegate;
+ (id) connectionWithURLString:(NSString*)urlString userAgent:(NSString*)userAgent delegate:(id<IHURLConnectionDelegate>)delegate;


- (void) cancel;

@end

