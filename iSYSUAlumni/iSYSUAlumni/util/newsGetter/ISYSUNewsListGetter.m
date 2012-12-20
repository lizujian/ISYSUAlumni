
#import "ISYSUNewsListGetter.h"

#define kURL	@"http://alumni.sysu.edu.cn/suaa/newslist.do?type=col&typeValue=c2010"
#define kURLSYSU @"http://news2.sysu.edu.cn/news01/index.htm"
//@"http://news2.sysu.edu.cn/ShowList.aspx?ArticleTypeID=1001"
#define kURLZHINIAN @"http://alumni.sysu.edu.cn/suaa/newslist.do?type=topic&colId=c2010&typeValue=461"
@implementation ISYSUNewsListGetter

- (id) initWithDelegate:(id<ISYSUGetterDelegate>)delegate withType:(NSInteger)type{
	self=[super init];
	if(self){
		_delegate = delegate;
        _newstype = type;
        if(type == 1)
            _connectionPtr = [IHURLConnection connectionWithURLString:kURL delegate:self];
        else if(type ==0)
            _connectionPtr = [IHURLConnection connectionWithURLString:kURLSYSU delegate:self];
        else
            _connectionPtr = [IHURLConnection connectionWithURLString:kURLZHINIAN delegate:self];

	}
	
	return self;
}

+ (id) getterWithDelegate:(id<ISYSUGetterDelegate>)delegate  withType:(NSInteger)type{
	return [[self alloc] initWithDelegate:delegate withType:type] ;
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

    NSString *path;
    if(type == 0)
        path = [[NSBundle mainBundle] pathForResource:@"newsList1" ofType:@"ihs"];
    else if(type == 1)
        path = [[NSBundle mainBundle] pathForResource:@"newsList" ofType:@"ihs"];
    else
        path = [[NSBundle mainBundle] pathForResource:@"newsList3" ofType:@"ihs"];
    _script = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

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
        NSLog(@"%@",string);
        NSString *script = [ISYSUNewsListGetter script:_newstype];
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
