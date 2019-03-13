//
//  AudioPlayerViewController.h
//  VideoPlayerDemo
//
//  Created by Apple on 12/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    BOOL isPlay;
    NSTimer *playbackTimer;
} 
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

NS_ASSUME_NONNULL_END
