//
//  DetailViewController.m
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/11.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "DetailViewController.h"
#import "UIColor+Util.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithHex:0x81F781]];
    
}

- (IBAction)handleButtonClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
