//
//  ViewController.m
//  VideoPlayerDemo
//
//  Created by Apple on 08/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioPlayerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *videoUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"3idiotd" ofType:@"mp4"]];
    AVAsset *asst=[AVAsset assetWithURL:videoUrl];
    AVPlayerItem *item=[[AVPlayerItem alloc]initWithURL:videoUrl];
    player=[AVPlayer playerWithPlayerItem:item];
    videoController=[[AVPlayerViewController alloc]init];
    NSLog(@"%f",CMTimeGetSeconds(asst.duration));
    _slidertime.minimumValue=0.0;
  _slidertime.maximumValue=CMTimeGetSeconds(asst.duration);
    videoController.player=player;
    videoController.view.frame=_viewVideo.bounds;
    [_viewVideo addSubview:videoController.view];
    [player pause];
    isPlay=NO;
    [player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1) queue:nil usingBlock:^(CMTime time) {
        self.slidertime.value=CMTimeGetSeconds(time);
    }];
    
    //    AVPlayerItem *item=[AVPlayerItem playerItemWithURL:videoUrl];
//
//    player=[[AVPlayer alloc]initWithPlayerItem:item];
//    player.volume=2.0;
//
//    AVPlayerLayer *layer1=[AVPlayerLayer playerLayerWithPlayer:player];
//    layer1.videoGravity=AVLayerVideoGravityResizeAspectFill;
//    layer1.frame=_viewVideo.layer.bounds;
//
//    /*AVPlayerViewController *videoController=[[AVPlayerViewController alloc]init];
//    videoController.view.frame=_viewVideo.bounds;
//    videoController.player=player;
//    videoController.showsPlaybackControls=YES;
//    */
//    //[_viewVideo addSubview:videoController.view];
//    [_viewVideo.layer addSublayer:layer1];
//    [player play];
    
}

- (IBAction)btnPlaypauseVideo:(id)sender {
    if (isPlay) {
    [player pause];
        isPlay=NO;
    }else{
        [player play];
        isPlay=YES;
    }
    
}
- (IBAction)btnSliderAction:(UISlider *)sender {
    [player seekToTime:CMTimeMakeWithSeconds(sender.value, 1)];
}
- (IBAction)btnAudioPlayer:(UIButton *)sender {
    [player seekToTime:CMTimeMakeWithSeconds(0, 1)];
    AudioPlayerViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"AudioPlayerViewController"];
    [self.navigationController pushViewController:obj animated:YES];
}



@end
