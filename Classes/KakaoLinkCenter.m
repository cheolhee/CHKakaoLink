//
// Copyright 2011 Kakao Corp. All rights reserved.
// @author kakaolink@kakao.com
// @version 1.0
//


#import "KakaoLinkCenter.h"

static NSString *StringByAddingPercentEscapesForURLArgument(NSString *string) {
	NSString *escapedString = (NSString *)
	CFURLCreateStringByAddingPercentEscapes(
										kCFAllocatorDefault,
									  (CFStringRef)string,
									  NULL,
									  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
									  kCFStringEncodingUTF8);
	return [escapedString autorelease];
}

static NSString *HTTPArgumentsStringForParameters(NSDictionary *parameters) {
	NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:[parameters count]];
	for (NSString *key in parameters) {
		NSString *parameter = [NSString stringWithFormat:@"%@=%@",
							   StringByAddingPercentEscapesForURLArgument(key),
							   StringByAddingPercentEscapesForURLArgument([parameters objectForKey:key])];
		[arguments addObject:parameter];
	}
	
	NSString *argumentsString = [arguments componentsJoinedByString:@"&"];
	return argumentsString;
}

static NSString *const KakaoLinkURLBaseString = @"kakaolink://sendurl";

static KakaoLinkCenter *sharedCenter = nil;

@implementation KakaoLinkCenter

+ (void)initialize {
	@synchronized(self) {
		static BOOL isInitialized = NO;
		if (!isInitialized) {
			sharedCenter = [[KakaoLinkCenter alloc] init];
		}
	}
}

- (void)dealloc {
	[super dealloc];
}

- (id)init {
	if ((self = [super init])) {
		
	}
	return self;
}

+ (KakaoLinkCenter *)defaultCenter {
	return sharedCenter;
}


#pragma mark -

- (BOOL)canOpenKakaoLink {
	NSURL *kakaoLinkTestURL = [NSURL URLWithString:KakaoLinkURLBaseString];
	return [[UIApplication sharedApplication] canOpenURL:kakaoLinkTestURL];
}

- (NSString *)kakaoLinkURLStringForParameters:(NSDictionary *)parameters {
	NSString *argumentsString = HTTPArgumentsStringForParameters(parameters);
	NSString *URLString = [NSString stringWithFormat:@"%@?%@", KakaoLinkURLBaseString, argumentsString];
	return URLString;
}

- (BOOL)openKakaoLinkWithURL:(NSString *)referenceURLString
				  appVersion:(NSString *)appVersion
				 appBundleID:(NSString *)appBundleID 
					   message:(NSString *)message {
	NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:4];
	if (referenceURLString) {
		[parameters setObject:referenceURLString forKey:@"url"];
	}
	if (message) {
		[parameters setObject:message forKey:@"msg"];
	}
	if (appVersion) {
		[parameters setObject:appVersion forKey:@"appver"];
	}
	if (appBundleID) {
		[parameters setObject:appBundleID forKey:@"appid"];
	}
	return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self kakaoLinkURLStringForParameters:parameters]]];
}

@end
