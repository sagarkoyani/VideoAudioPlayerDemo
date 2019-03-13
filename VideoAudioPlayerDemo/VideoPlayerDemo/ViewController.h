//
//  ViewController.h
//  VideoPlayerDemo
//
//  Created by Apple on 08/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVPlayer *player;
    AVPlayerViewController *videoController;
    BOOL isPlay;
}
@property (weak, nonatomic) IBOutlet UIView *viewVideo;
@property (weak, nonatomic) IBOutlet UISlider *slidertime;
- (IBAction)sliderAction:(id)sender;


@end

