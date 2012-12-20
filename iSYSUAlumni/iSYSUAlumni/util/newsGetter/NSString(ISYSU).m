
#import "NSString(ISYSU).h"

#import <iconv.h>

NSMutableString *_decodedStringPtr;


@implementation NSString(ISYSU)

- (NSString*) stringByDecodingEntities{
	NSString *result = nil;
	@synchronized(_decodedStringPtr){
		_decodedStringPtr = [[NSMutableString alloc] init];
		NSString *string = self;
		//string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
		string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString* xmlString = [NSString stringWithFormat:@"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"> <z>%@</z>", string];
		NSData *data = [xmlString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
		NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
		[parser setDelegate:self];
		[parser parse];
		result = [NSString stringWithString:_decodedStringPtr];
		_decodedStringPtr = nil;
	}
	return result;
}
- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	[_decodedStringPtr appendString:string];
}
- (void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{

}

- (NSString*) stringByRemovingElements{
	NSMutableString *string = [[NSMutableString alloc] init];
	BOOL inside = NO;
	for(int i=0,count=[self length]; i<count; i++){
		unichar ch = [self characterAtIndex:i];
		switch(ch){
			case '<':
				inside = YES;
				break;
			case '>':
				inside = NO;
				break;
			default:
				if(!inside)
					[string appendFormat:@"%C",ch];
				break;
		}
	}
	NSString *result = [NSString stringWithString:string];
	
	return result;
}

+ (NSString*) stringWithGB18030Data:(NSData*)data{
	if(data==nil)
		return nil;
	NSString *result = nil;
	size_t buffSize = [data length]*2+1;
	char *buff = (char*)malloc(buffSize);
	memset(buff, 0, buffSize);
	if(buff==NULL)
		return nil;
	int discardIllegalSequence = 1;
	char *inBytes = (char*)[data bytes];
	size_t inBytesLeft = [data length];
	char *outBytes = buff;
	size_t outBytesLeft = buffSize;
	iconv_t converter = iconv_open("UTF-8//IGNORE", "GB18030");
	if(converter!=(iconv_t)(-1)){
		iconvctl(converter, ICONV_SET_DISCARD_ILSEQ, &discardIllegalSequence);
		size_t rt = iconv(converter, &inBytes, &inBytesLeft, &outBytes, &outBytesLeft);
		iconv_close(converter);
		if(rt!=(size_t)(-1))
			result = [NSString stringWithCString:buff encoding:NSUTF8StringEncoding];
		NSLog(@"out:%s",buff);
	}
	free(buff);
	
	return result;
}

@end
