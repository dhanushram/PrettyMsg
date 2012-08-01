//
//  MsgActivityView.h
//  prettymsg
//
//  Created by Dhanush Balachandran on 7/7/12.
//  Copyright (c) 2012 My Things App Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgActivityView : UIView

- (id) initWithView: (UIView*) largerView;

- (void) showMsgAndAnimate: (NSString*) msg;
-(void) stopMsg;


@end
