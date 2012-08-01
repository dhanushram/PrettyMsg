//
//  MsgActivityView.m
//  prettymsg
//
//  Created by Dhanush Balachandran on 7/7/12.
//  Copyright (c) 2012 My Things App Inc. All rights reserved.
//

#import "MsgActivityView.h"

@interface MsgActivityView ()
{
    UIActivityIndicatorView * spinner;
    UIView * largeView;
}

@end

@implementation MsgActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithView: (UIView*) largerView
{
    self = [super initWithFrame:CGRectMake(largerView.center.x-100, largerView.center.y-65, 200, 100)];
    largeView = largerView;
    return self;
}

- (void) showMsgAndAnimate: (NSString*) msg
{
    //Add background image
    UIImage * backgroundimage = [[UIImage imageNamed:@"background"]resizableImageWithCapInsets:UIEdgeInsetsMake(10,10,10,10)];
    UIImageView * imgview = [[UIImageView alloc] initWithImage:backgroundimage];
    imgview.frame = self.bounds;
    [self addSubview:imgview];
    
    //Add Label
    UILabel * label = [[UILabel alloc] init];
    label.text = msg;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 3;
    label.frame = CGRectMake(self.bounds.origin.x+3, self.bounds.origin.y+3, self.bounds.size.width-6, self.bounds.size.height/2);
    [self addSubview:label];
    
    if (!spinner) 
    {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
    
    [spinner startAnimating];
    spinner.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height * 2/3);
    [self addSubview:spinner];
    [self bringSubviewToFront:spinner];

    [UIView animateWithDuration:0.5 animations:
     ^{    
         [largeView addSubview:self];

     }];

}

-(void) stopMsg
{
    [UIView animateWithDuration:0.5 animations:
     ^{     
         [spinner stopAnimating];
         [self removeFromSuperview];
     }];
}


#pragma mark - Print methods
- (void) printBounds: (CGRect) bound 
          fromMethod: (NSString *) methodname
{
    NSLog(@"%@: (Origin X: %f Origin Y: %f)  (Width:%f  Height:%f)", methodname, bound.origin.x,bound.origin.y,bound.size.width, bound.size.height);
}

- (void) printPoint: (CGPoint) point
         fromMethod: (NSString *) methodname
{
    NSLog(@"%@: (x1: %f y1: %f)",methodname, point.x, point.y);
}

- (void) printSize: (CGSize) mysize
        fromMethod: (NSString *) methodname
{
    NSLog(@"%@: (Width: %f Height: %f)",methodname, mysize.width, mysize.height);
}


@end
