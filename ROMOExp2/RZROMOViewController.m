//
//  RZROMOViewController.m
//  ROMOExp2
//
//  Created by RM on 2/17/14.
//  Copyright (c) 2014 Ruimin Zhang. All rights reserved.
//

#import "RZROMOViewController.h"

@interface RZROMOViewController ()

@end

@implementation RZROMOViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // init an audioPlayer
    self.audioPlayer = [[YMCAudioPlayer alloc] init];
    
    //[self setupAudioPlayer:[@"%@", self.filename] fileExtension:@"wav"];
    //[self.audioPlayer playAudio];
    
    // Grab a shared instance of the Romo character
    self.romo = [RMCharacter Romo];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 
 * Setup the AudioPlayer with
 * Filename and FileExtension like .wav
 * Loading audioFile and sets the time labels
 */

-(void)setupAudioPlayer:(NSString*) filename fileExtension:(NSString*)extension {
    [self.audioPlayer initPlayer:filename fileExtension:extension];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Add Romo's face to self.view whenever the view will appear
    
    [self setupAudioPlayer:self.filename fileExtension:@"wav"];
    
    [self.romo addToSuperview:self.view];
     NSLog(@"Appear filename is %@", self.filename);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Removing Romo from the superview stops animations and sounds
    [self.romo removeFromSuperview];
}

#pragma mark -- Touch Events --

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self lookAtTouchLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self lookAtTouchLocation:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.romo lookAtDefault];
    
    /*
    // Constants for the number of expression & emotion enum values
    int numberOfExpressions = 19;
    int numberOfEmotions = 7;

    // Choose a random expression from 1 to numberOfExpressions
    RMCharacterExpression randomExpression = 1 + (arc4random() % numberOfExpressions);
    // Choose a random expression from 1 to numberOfEmotions
    RMCharacterEmotion randomEmotion = 1 + (arc4random() % numberOfEmotions);
    [self.romo setExpression:randomExpression withEmotion:randomEmotion];
    */
    
    RMCharacterExpression myExpression = 0;
    if (self.emotion == 1){
        myExpression = 3;
    }else if(self.emotion == 2){
        myExpression = 6;
    }else if(self.emotion == 3){
        myExpression = 8;   
    }else if(self.emotion == 4){
        myExpression = 14;
    }else if(self.emotion == 5){
        myExpression = 15;
    }else if(self.emotion == 6){
        myExpression = 16;
    }
    
    
    RMCharacterEmotion myEmotion = self.emotion;
    [self.romo setExpression:myExpression withEmotion:myEmotion];    
    [self.audioPlayer playAudio];
    
    NSLog(@"My emotion and expression is %d", self.emotion);
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Tell Romo to reset his eyes
    [self.romo lookAtDefault];
}

#pragma mark -- Private Methods --

- (void)lookAtTouchLocation:(CGPoint)touchLocation
{
    // Maxiumum distance from the center of the screen = half the width
    CGFloat w_2 = self.view.frame.size.width / 2;
    
    // Maximum distance from the middle of the screen = half the height
    CGFloat h_2 = self.view.frame.size.height / 2;
    
    // Ratio of horizontal location from center
    CGFloat x = (touchLocation.x - w_2)/w_2;
    
    // Ratio of vertical location from middle
    CGFloat y = (touchLocation.y - h_2)/h_2;
    
    // Since the touches are on Romo's face, they 
    CGFloat z = 0.0;
    
    // Romo expects a 3D point
    // x and y between -1 and 1, z between 0 and 1
    // z controls how far the eyes diverge
    // (z = 0 makes the eyes converge, z = 1 makes the eyes parallel)
    RMPoint3D lookPoint = RMPoint3DMake(x, y, z);
    
    // Tell Romo to look at the point
    // We don't animate because lookAtTouchLocation: runs at many Hertz
    [self.romo lookAtPoint:lookPoint animated:NO];
    
}


@end
