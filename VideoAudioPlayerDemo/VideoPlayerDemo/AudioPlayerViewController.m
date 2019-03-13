//
//  AudioPlayerViewController.m
//  VideoPlayerDemo
//
//  Created by Apple on 12/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AudioPlayerViewController.h"

@interface AudioPlayerViewController ()

@end

@implementation AudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *audioURL=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"audio" ofType:@"mp3"]];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:audioURL error:nil];
    [audioPlayer pause];
    _slider.minimumValue=0.0;
    _slider.maximumValue=audioPlayer.duration;
    
}

- (IBAction)SliderAudioAction:(UISlider *)sender {
    audioPlayer.currentTime=sender.value;
}

- (IBAction)btnPlayPauseAudio:(UIButton *)sender {
    if (audioPlayer.isPlaying) {
        [audioPlayer pause];
        
    }else{
            [audioPlayer play];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateAudioProgressView) userInfo:nil repeats:true];
    }
}
-(void)updateAudioProgressView{
    _slider.value=audioPlayer.currentTime;
}
- (IBAction)btnBack:(id)sender {
    [audioPlayer pause];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
