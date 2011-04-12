//
//  NEKakaoViewController.m
//  NEKakao
//
//  Created by cheolhee on 11/04/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CHKakaoViewController.h"
#import "KakaoLinkCenter.h"

@implementation CHKakaoViewController

@synthesize tf = _tf;
@synthesize urltf = _urltf;
@synthesize sendBtn = _sendBtn;


-(IBAction)sendMessage {
	NSString *message = _tf.text;//@"카카오링크를 사용하여 메시지를 전달해보세요.";
	NSString *referenceURLString = _urltf.text;// @"http://link.kakao.com";
	NSString *appBundleID = @"com.mycompany.CHKakao";
	NSString *appVersion = @"1.0";
	
	if ([@"http://" isEqual:referenceURLString]) {
		referenceURLString = @"";
	}
	
	if ([[KakaoLinkCenter defaultCenter] canOpenKakaoLink]) {
		[[KakaoLinkCenter defaultCenter] openKakaoLinkWithURL:referenceURLString 
												   appVersion:appVersion
												  appBundleID:appBundleID
													  message:message];
	} else {
		// 카카오톡이 설치되어 있지 않은 경우에 대한 처리
		
	}	
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.tf = nil;
	self.urltf = nil;
	self.sendBtn = nil;
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.tf = nil;
	self.urltf = nil;
	self.sendBtn = nil;

    [super dealloc];
}

@end

