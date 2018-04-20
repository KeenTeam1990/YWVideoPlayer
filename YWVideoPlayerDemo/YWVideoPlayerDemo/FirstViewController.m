//
//  FirstViewController.m
//  YWIjkplayer
//
//  Created by Candy on 2018/1/10.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import "FirstViewController.h"
#import "YWMediaPlayerView.h"
#import "AppDelegate.h"

@interface FirstViewController () <YWMediaPlayerViewDelegate>

@property (nonatomic, strong)YWMediaPlayerView  *mediaPlayerView;
@property (nonatomic, strong)UIView             *playerView;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 确保在该控制器即将消失的时候开启全屏模式
    ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 确保在该控制器即将消失的时候关闭全屏模式
    ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YWSCREEN_WIDTH, (YWSCREEN_WIDTH / 16 * 9))];
    _playerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_playerView];
    _mediaPlayerView = [[YWMediaPlayerView alloc]init];
    
  
    NSString *testUrl = @"rtmp://hzrtmp01.ys7.com:1935/livestream/472637161_1_1_1_0";
    [_mediaPlayerView playerViewWithUrl:testUrl WithTitle:@"视频的标题" WithView:_playerView  WithDelegate:self];
    
    _mediaPlayerView.mediaControl.totalDurationLabel.hidden = YES;
    _mediaPlayerView.mediaControl.mediaProgressSlider.hidden = YES;
    _mediaPlayerView.mediaControl.currentTimeLabel.hidden = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 自动播放
        [_mediaPlayerView.mediaControl playControl];
    });
}

/// 改变View大小布局
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft ||
        [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _mediaPlayerView.frame = CGRectMake(0, 0, size.width,size.height);
        _mediaPlayerView.player.view.frame = CGRectMake(0, 0, size.width,size.height);
        _mediaPlayerView.mediaControl.fullScreenBtn.selected = YES;
        _mediaPlayerView.isFullScreen = YES;
        [window addSubview:_mediaPlayerView];
    } else {
        _mediaPlayerView.frame = CGRectMake(0, 0, size.width, size.width/16*9);
        _mediaPlayerView.player.view.frame = CGRectMake(0, 0, size.width, size.width/16*9);
        _mediaPlayerView.mediaControl.fullScreenBtn.selected = YES;
        _mediaPlayerView.isFullScreen = YES;
        [_playerView addSubview:_mediaPlayerView];
    }
}

/// 点击关闭按钮
- (void)playerViewClosed:(YWMediaPlayerView *)player {
    
//    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
}

/// 全屏/非全屏切换
- (void)playerView:(YWMediaPlayerView *)player fullscreen:(BOOL)fullscreen {
    
//    if (fullscreen == YES) {
//        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
//    } else {
//        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
//        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
//    }
}

/// 播放失败
- (void)playerViewFailePlay:(YWMediaPlayerView *)player {
    NSLog(@"播放失败");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

