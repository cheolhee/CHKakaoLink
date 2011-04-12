//
//  NEKakaofile://localhost/Users/admin/Downloads/kakaotalk_icon/kakaotalk_intro_kr.pngViewController.h
//  NEKakao
//
//  Created by cheolhee on 11/04/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHKakaoViewController : UIViewController {

	
	
	UITextField *_tf;
	UITextField *_urltf;
	UIButton *_sendBtn;
}

@property (nonatomic, retain) IBOutlet UITextField *tf;
@property (nonatomic, retain) IBOutlet UITextField *urltf;
@property (nonatomic, retain) IBOutlet UIButton *sendBtn;

-(IBAction)sendMessage;


@end


