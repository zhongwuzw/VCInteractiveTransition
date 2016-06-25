//
//  ViewController.m
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/11.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "PushAnimator.h"
#import "PopAnimator.h"

@interface ViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIPanGestureRecognizer *edge = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeftEdge:)];
    [self.navigationController.view addGestureRecognizer:edge];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonClicked:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    DetailViewController *vc = [DetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPush)
        return [[PushAnimator alloc] init];
    
    if (operation == UINavigationControllerOperationPop)
        return [[PopAnimator alloc] init];
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactionController;
}

#pragma mark -
#pragma mark - handleSwipe

- (void)handleSwipeFromLeftEdge:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGPoint translate = [gesture translationInView:[UIApplication sharedApplication].delegate.window];
    CGFloat percent   = translate.x / self.view.bounds.size.width;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.interactionController updateInteractiveTransition:percent];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [gesture velocityInView:gesture.view];
        if (velocity.x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}


@end
