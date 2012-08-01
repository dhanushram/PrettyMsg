//
//  ViewController.m
//  prettymsg
//
//  Created by Dhanush Balachandran on 6/23/12.
//  Copyright (c) 2012 My Things App Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int i;
    MsgActivityView * messenger;
    BOOL showing;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    i=0;
    showing = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void)viewDidAppear:(BOOL)animated
{
   messenger = [[MsgActivityView alloc] initWithView:self.view];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)showMsge:(id)sender {
    
    [self showPrettyMsg:@"Pretty Message" fontsize:17.0 forduration:3.0];
}

- (IBAction)showSpinner:(id)sender {
    if (!showing)
    {
        [messenger showMsgAndAnimate:@"Pretty Message with Spinner"];
        showing = TRUE;
    }
    else
    {
        [messenger stopMsg];
        showing = FALSE;
    }
}




#pragma mark - Pretty Message Method
- (void) showPrettyMsg: (NSString *) msg
              fontsize: (CGFloat) fontsize
           forduration: (NSTimeInterval) duration

{
    int height = ([msg length] > 30)? 100 : 60;
    int offset = ([msg length] > 30)? 20 : 0;
    UIView * view = self.view;
    //Create a view
    UIView * boxView = [[UIView alloc] initWithFrame:CGRectMake(view.center.x-100, view.center.y-65-offset, 200, height)];
    
    //Add background image
    UIImage * backgroundimage = [[UIImage imageNamed:@"background"]resizableImageWithCapInsets:UIEdgeInsetsMake(10,10,10,10)];
    UIImageView * imgview = [[UIImageView alloc] initWithImage:backgroundimage];
    imgview.frame = boxView.bounds;
    [boxView addSubview:imgview];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = msg;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontsize];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 3;
    label.frame = CGRectMake(boxView.bounds.origin.x+3, boxView.bounds.origin.y+3, boxView.bounds.size.width-6, boxView.bounds.size.height - 6);
    [boxView addSubview:label];
    [boxView bringSubviewToFront:label];
    
    //boxView.center = view.center;
    
    UIViewAnimationOptions options = UIViewAnimationOptionCurveLinear;
    boxView.alpha = 0.1;
    [view addSubview:boxView];
    
    double x = duration / 3;
    
    //Animate
    [UIView animateWithDuration:x delay:0 options:options animations:
     ^{
         boxView.alpha = 1.0;
         
         
     } completion:^(BOOL finished)
     {
         [UIView animateWithDuration:x delay:x options:options animations:
          ^{
              boxView.alpha = 0.1;
              
              
          } completion:^(BOOL finished)
          {
              [boxView removeFromSuperview];
          }];
         
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
