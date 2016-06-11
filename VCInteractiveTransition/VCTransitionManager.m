//
//  VCTransitionManager.m
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/11.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "VCTransitionManager.h"

@implementation VCTransitionManager

#pragma mark -
#pragma mark UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

#pragma mark -
#pragma mark UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *src = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *dest = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [transitionContext completeTransition:YES];
}
@end
