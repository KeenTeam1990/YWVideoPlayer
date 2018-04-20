//
//  SecondViewController.m
//  YWIjkplayer
//
//  Created by Candy on 2018/1/26.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isLiveVideo = YES;
    [self.view addSubview:self.playerView];
   
 
    NSString *testUrl = @"rtmp://hzrtmp01.ys7.com:1935/livestream/472637161_1_1_1_0";
    
    [self showPlayerViewWithUrl:testUrl Title:@"视频的标题"];
    [self autoPlay];
}


@end
