//
//  ViewController.m
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/11.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"首页"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonClicked:(UIButton *)sender {
    DetailViewController *vc = [DetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
