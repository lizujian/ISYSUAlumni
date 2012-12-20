
#import <Foundation/Foundation.h>


@interface NSString(ISYSU)<NSXMLParserDelegate>
- (NSString*) stringByDecodingEntities;
- (NSString*) stringByRemovingElements;
+ (NSString*) stringWithGB18030Data:(NSData*)data;
@end
