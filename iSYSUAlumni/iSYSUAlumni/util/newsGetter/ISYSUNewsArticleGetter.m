
#import "ISYSUNewsArticleGetter.h"


@implementation ISYSUNewsArticleGetter

@synthesize articleID=_articleID;

- (id) initWithArticleID:(NSString*)articleID delegate:(id<ISYSUGetterDelegate>)delegate newsType:(NSInteger)type{
	self=[super init];
	if(self){
		_articleID = articleID;
		_delegate = delegate;
        NSString *urlString = nil;
        _type = type;
        if(type == 1)
            urlString = [NSString stringWithFormat:@"http://alumni.sysu.edu.cn/suaa/showNews.do?lmid=c2010&newsId=%@",articleID];
        else if(type == 0)
            //urlString = [NSString stringWithFormat:@"http://news2.sysu.edu.cn/ShowArticle.aspx?ArticleID=%@",articleID];
            urlString = [NSString stringWithFormat:@"http://news2.sysu.edu.cn/news01/%@.htm",articleID];
        else
            urlString = [NSString stringWithFormat:@"http://alumni.sysu.edu.cn/suaa/showNews.do?lmid=%@",articleID];
        
        NSLog(@"%@",urlString);
        //
		_connectionPtr = [IHURLConnection connectionWithURLString:urlString delegate:self];
	}
	
	return self;
}


+ (id) getterWithArticleID:(NSString*)articleID delegate:(id<ISYSUGetterDelegate>)delegate newsType:(NSInteger)type{
	return [[self alloc] initWithArticleID:articleID delegate:delegate newsType:type];
}

- (void) cancel{
	if(_connectionPtr==nil&&_hunterPtr==nil)
		return;
	
	[_connectionPtr cancel];
	_connectionPtr = nil;
	[_hunterPtr cancel];
	_hunterPtr = nil;
}

+ (NSString*) script:(NSInteger)type{
	static NSString *_script = nil;
//	if(_script==nil){
		NSString *path = nil;
        path = [[NSBundle mainBundle] pathForResource:(type==0)?@"newsArticle1":@"newsArticle" ofType:@"ihs"];
		_script = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//	}
	return _script;
}


#pragma mark IHURLConnectionDelegate

- (void) connectionFailed:(IHURLConnection *)connection{
	_connectionPtr = nil;
	[_delegate getterFailed:self];
}

- (void) connection:(IHURLConnection*)connection finishedLoadingWithData:(NSData*)data{
	_connectionPtr = nil;
	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if(string){
        NSString *script = [ISYSUNewsArticleGetter script:_type];
        _hunterPtr = [InfoHunter hunterWithString:string language:script delegate:self];
    }else{
        [_delegate getterFailed:self];
    }
}


#pragma mark InfoHunterDelegate

- (void) hunter:(InfoHunter *)hunter finishedWithResult:(NSMutableDictionary *)dict{
	if(dict!=nil)
		[_delegate getterSucceeded:self withInfo:dict];
	else
		[_delegate getterFailed:self];
}

@end
