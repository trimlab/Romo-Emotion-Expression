//
//  RZMainViewController.h
//  ROMOExp2
//
//  Created by RM on 2/17/14.
//  Copyright (c) 2014 Ruimin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RZROMOViewController.h" // to import the header of a customerized class use double quotes 

@interface RZMainViewController : UIViewController

@property int expID;
@property int numOfExp;
@property NSArray *ScriptTypes, *Emotions, *Genders; 
@property (weak, nonatomic) IBOutlet UIButton *START;

@end
