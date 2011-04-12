//
// Copyright 2011 Kakao Corp. All rights reserved.
// @author kakaolink@kakao.com
// @version 1.0
//

#ifndef __IPHONE_3_0
#error "This class uses features only available in iPhone SDK 3.0 and later."
#endif

#import <UIKit/UIKit.h>

/**
 * 
 */
@interface KakaoLinkCenter : NSObject {
@private
}

/**
 * Returns the default singleton instance.
 */
+ (KakaoLinkCenter *)defaultCenter;

/**
 * Returns whether the application can open kakaolink URLs.
 */
- (BOOL)canOpenKakaoLink;

/**
 * Gets a kakaolink URL for parameters.
 */
- (NSString *)kakaoLinkURLStringForParameters:(NSDictionary *)parameters;

/**
 * Opens kakaolink with parameters.
 */
- (BOOL)openKakaoLinkWithURL:(NSString *)referenceURLString
				  appVersion:(NSString *)appVersion
				 appBundleID:(NSString *)appBundleID
					 message:(NSString *)message;

@end
