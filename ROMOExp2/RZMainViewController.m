//
//  RZMainViewController.m
//  ROMOExp2
//
//  Created by RM on 2/17/14.
//  Copyright (c) 2014 Ruimin Zhang. All rights reserved.
//

#import "RZMainViewController.h"
#import "RZROMOViewController.h"

@interface RZMainViewController ()

@end

@implementation RZMainViewController

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
    self.numOfExp = 36;
    self.Genders = [NSArray arrayWithObjects: @"female", @"male", nil];
    self.ScriptTypes = [NSArray arrayWithObjects: @"P01", @"P02", @"P03", nil];
    self.Emotions = [NSArray arrayWithObjects: @"neutral", @"curious", @"excited", @"happy", @"sad", @"scared", @"sleepy", nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HandleButtonDownEvent:(id)sender {
    [self.START setTitle:@"Next" forState:UIControlStateNormal];    
}

- (void) prepareForSegue: (UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segue1"]){
        self.expID = arc4random() % 36;
        
        RZROMOViewController *ROMOview = (RZROMOViewController *) segue.destinationViewController; 
        [ROMOview.ID setTitle:[NSString stringWithFormat:@"ID: %i", self.expID] forState:UIControlStateNormal];
        
        
        
        int type = self.expID % 3;
        int gender = self.expID % 2;
        int emotion = self.expID % 6 + 1;
        
        ROMOview.emotion = emotion;
        
        NSMutableString *filename = [NSMutableString stringWithString:@""];
        NSString *fileType = [self.ScriptTypes objectAtIndex:type];
        NSString *fileGender = [self.Genders objectAtIndex:gender];
        NSString *fileEmotion = [self.Emotions objectAtIndex:emotion];
        
        [filename appendString:fileType];
        [filename appendString:@"_"];
        [filename appendString:fileEmotion];
        [filename appendString:@"_"];
        [filename appendString:fileGender];
        
        ROMOview.filename = [NSMutableString stringWithString:@""];
        [ROMOview.filename appendString:filename]; 
        NSLog(@"push romo view filename is %@", ROMOview.filename);
       
    }
}

@end
