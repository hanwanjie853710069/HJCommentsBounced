//
//  ViewController.m
//  HJCommentsBounced
//
//  Created by 韩小杰 on 2019/2/14.
//  Copyright © 2019 韩小杰. All rights reserved.
//

#import "ViewController.h"
#import "HJPopViewController.h"
#import "HJView.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) HJPopViewController *popVC;

/** <#statements#> */
@property (nonatomic,strong) HJView *hjview;


/** beginPoint */
@property (nonatomic,assign) CGPoint beginPoint ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.popVC = [[HJPopViewController alloc] init];
    [self addChildViewController:self.popVC];
    
    
    self.hjview = [[HJView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.hjview];
    
    [self.view addSubview:self.popVC.view];
    
 
    UIPanGestureRecognizer* rightRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    rightRecognizer.delegate = self;
    [self.popVC.view addGestureRecognizer:rightRecognizer];
}

- (void)handleSwipeFrom:(UIPanGestureRecognizer *)recognizer{
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan: {
            self.beginPoint = self.popVC.view.frame.origin;
        } break;
        case UIGestureRecognizerStateChanged: {
            
            CGPoint point = [recognizer translationInView:self.popVC.view];
            
            CGFloat tempY = point.y + self.beginPoint.y;
            
            CGFloat max = MAX(tempY, 50);
            CGFloat min = MIN(max, self.popVC.view.frame.size.height);
            
            
            self.popVC.view.frame = CGRectMake(self.popVC.view.frame.origin.x,
                                               min,
                                               self.popVC.view.frame.size.width,
                                               self.popVC.view.frame.size.height);
        } break;
        case UIGestureRecognizerStateEnded: {
            
            if (self.popVC.view.frame.origin.y > 375) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.popVC.view.frame = CGRectMake(self.popVC.view.frame.origin.x, 600, self.popVC.view.frame.size.width, self.popVC.view.frame.size.height);
                }];
            }
            
            if (self.popVC.view.frame.origin.y < 375) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.popVC.view.frame = CGRectMake(self.popVC.view.frame.origin.x, 50, self.popVC.view.frame.size.width, self.popVC.view.frame.size.height);
                }];
            }
            
        } break;
        case UIGestureRecognizerStateCancelled : {
            
        }
        default:break;
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if (self.popVC.tableView.contentOffset.y > 0) {
        
        return NO;
    } else {
        
//        self.popVC.tableView.contentOffset = CGPointZero;
    }
    
    return YES;
}


@end
/*
CGFloat tempY = point.y + self.popVC.view.frame.origin.y;

CGFloat max = MAX(tempY, 0);
CGFloat min = MIN(max, self.popVC.view.frame.size.height);
*/
