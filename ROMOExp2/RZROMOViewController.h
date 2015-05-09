//
//  RZROMOViewController.h
//  ROMOExp2
//
//  Created by RM on 2/17/14.
//  Copyright (c) 2014 Ruimin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <RMCharacter/RMCharacter.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "YMCAudioPlayer.h"


@interface RZROMOViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *ID;
@property (nonatomic, strong) RMCharacter *romo;
@property (nonatomic, retain) YMCAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSMutableString *filename;
@property int emotion;

@end