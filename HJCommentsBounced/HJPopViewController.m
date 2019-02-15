//
//  HJPopViewController.m
//  HJCommentsBounced
//
//  Created by 韩小杰 on 2019/2/14.
//  Copyright © 2019 韩小杰. All rights reserved.
//

#import "HJPopViewController.h"

@interface HJPopViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>



@property (nonatomic,assign) CGPoint beginPoint;

@end

@implementation HJPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    self.tableView = [[Hjtableview alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;

    [self.view addSubview:self.tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.beginPoint = scrollView.contentOffset;
    NSLog(@"______________%f",self.beginPoint.y);
//    self.tableView.userInteractionEnabled = NO;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    self.tableView.userInteractionEnabled = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
//        self.tableView.isTo = NO;
//        CGFloat x = scrollView.contentOffset.y;
//        NSLog(@"%f",0 - x);
//        self.view.frame = CGRectMake(self.view.frame.origin.x,
//                                     0 - x,
//                                     self.view.frame.size.width, self.view.frame.size.height);
        
//        self.tableView.contentOffset = CGPointMake(0, 0);
//        self.tableView.scrollEnabled = NO;
        
    } else {
//        self.tableView.scrollEnabled = YES;
//        self.tableView.isTo = YES;
    }
    
    
}



@end
