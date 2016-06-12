//
//  PopAnimator.m
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/12.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "PopAnimator.h"

@implementation PopAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGRect f = fromViewController.view.frame;
    f.origin.x = f.origin.x + f.size.width;
    toViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.transform = CGAffineTransformMakeScale(1/0.9, 1/0.9);
        fromViewController.view.frame = f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

@end
