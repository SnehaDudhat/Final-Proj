//
//  MZTransition.m
//  MZFormSheetController
//
//  Created by Michał Zaborowski on 21.12.2013.
//  Copyright (c) 2013 Michał Zaborowski. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "MZTransition.h"
#import "MZFormSheetController.h"

NSString *const MZTransitionExceptionMethodNotImplemented = @"MZTransitionExceptionMethodNotImplemented";

CGFloat const MZTransitionDefaultBounceDuration = 0.4;
CGFloat const MZTransitionDefaultDropDownDuration = 0.4;

@implementation MZTransition

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    [NSException raise:MZTransitionExceptionMethodNotImplemented format:@"-[%@ entryFormSheetControllerTransition:completionHandler:] must be implemented", NSStringFromClass([self class])];
}
- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    [NSException raise:MZTransitionExceptionMethodNotImplemented format:@"-[%@ exitFormSheetControllerTransition:completionHandler:] must be implemented", NSStringFromClass([self class])];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    void(^completionHandler)(void) = [anim valueForKey:@"completionHandler"];
    if (completionHandler) {
        completionHandler();
    }
}

@end

@interface MZSlideFromTopTransition : MZTransition
@end

@implementation MZSlideFromTopTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideFromTop];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    CGRect originalFormSheetRect = formSheetRect;
    formSheetRect.origin.y = -formSheetRect.size.height;
    formSheetController.presentedFSViewController.view.frame = formSheetRect;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = originalFormSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.y = -formSheetController.view.bounds.size.height;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZSlideFromBottomTransition : MZTransition
@end

@implementation MZSlideFromBottomTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideFromBottom];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    CGRect originalFormSheetRect = formSheetRect;
    formSheetRect.origin.y = formSheetController.view.bounds.size.height;
    formSheetController.presentedFSViewController.view.frame = formSheetRect;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = originalFormSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.y = formSheetController.view.bounds.size.height;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                        completionHandler();
                     }];
}
@end

@interface MZSlideFromLeftTransition : MZTransition
@end

@implementation MZSlideFromLeftTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideFromLeft];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    CGRect originalFormSheetRect = formSheetRect;
    formSheetRect.origin.x = -formSheetController.view.bounds.size.width;
    formSheetController.presentedFSViewController.view.frame = formSheetRect;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = originalFormSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.x = -formSheetController.view.bounds.size.width;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZSlideFromRightTransition : MZTransition
@end

@implementation MZSlideFromRightTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideFromRight];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    CGRect originalFormSheetRect = formSheetRect;
    formSheetRect.origin.x = formSheetController.view.bounds.size.width;
    formSheetController.presentedFSViewController.view.frame = formSheetRect;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = originalFormSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.x = formSheetController.view.bounds.size.width;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZSlideBounceFromLeftTransition : MZTransition <CAAnimationDelegate>
@end

@implementation MZSlideBounceFromLeftTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideAndBounceFromLeft];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGFloat x = formSheetController.presentedFSViewController.view.center.x;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    animation.values = @[@(x - formSheetController.view.bounds.size.width), @(x + 20), @(x - 10), @(x)];
    animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = MZTransitionDefaultDropDownDuration;
    animation.delegate = self;
    [animation setValue:completionHandler forKey:@"completionHandler"];
    [formSheetController.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounceLeft"];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.x = -formSheetController.view.bounds.size.width;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZSlideBounceFromRightTransition : MZTransition<CAAnimationDelegate>
@end

@implementation MZSlideBounceFromRightTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleSlideAndBounceFromRight];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGFloat x = formSheetController.presentedFSViewController.view.center.x;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    animation.values = @[@(x + formSheetController.view.bounds.size.width), @(x - 20), @(x + 10), @(x)];
    animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = MZTransitionDefaultBounceDuration;
    animation.delegate = self;
    [animation setValue:completionHandler forKey:@"completionHandler"];
    [formSheetController.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounceRight"];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGRect formSheetRect = formSheetController.presentedFSViewController.view.frame;
    formSheetRect.origin.x = formSheetController.view.bounds.size.width;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.frame = formSheetRect;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZFadeTransition : MZTransition
@end

@implementation MZFadeTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleFade];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    formSheetController.presentedFSViewController.view.alpha = 0;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                     animations:^{
                         formSheetController.presentedFSViewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end

@interface MZBounceTransition : MZTransition<CAAnimationDelegate>
@end

@implementation MZBounceTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleBounce];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    bounceAnimation.fillMode = kCAFillModeBoth;
    bounceAnimation.duration = MZTransitionDefaultBounceDuration;
    bounceAnimation.values = @[
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 0.01f)],
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.1f)],
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 0.9f)],
                               [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    bounceAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    bounceAnimation.timingFunctions = @[
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    bounceAnimation.delegate = self;
    [bounceAnimation setValue:completionHandler forKey:@"completionHandler"];
    [formSheetController.presentedFSViewController.view.layer addAnimation:bounceAnimation forKey:@"bounce"];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(1), @(1.2), @(0.01)];
    animation.keyTimes = @[@(0), @(0.4), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = MZFormSheetControllerDefaultAnimationDuration;
    animation.delegate = self;
    [animation setValue:completionHandler forKey:@"completionHandler"];
    [formSheetController.presentedFSViewController.view.layer addAnimation:animation forKey:@"bounce"];

    formSheetController.presentedFSViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
}
@end

@interface MZDropDownTransition : MZTransition<CAAnimationDelegate>
@end

@implementation MZDropDownTransition
+ (void)load
{
    [MZFormSheetController registerTransitionClass:self forTransitionStyle:MZFormSheetTransitionStyleDropDown];
}

- (void)entryFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGFloat y = formSheetController.presentedFSViewController.view.center.y;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    animation.values = @[@(y - formSheetController.view.bounds.size.height), @(y + 20), @(y - 10), @(y)];
    animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = MZTransitionDefaultDropDownDuration;
    animation.delegate = self;
    [animation setValue:completionHandler forKey:@"completionHandler"];
    [formSheetController.presentedFSViewController.view.layer addAnimation:animation forKey:@"dropdown"];
}

- (void)exitFormSheetControllerTransition:(MZFormSheetController *)formSheetController completionHandler:(MZTransitionCompletionHandler)completionHandler
{
    CGPoint point = formSheetController.presentedFSViewController.view.center;
    point.y += formSheetController.view.bounds.size.height;
    [UIView animateWithDuration:MZFormSheetControllerDefaultAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         formSheetController.presentedFSViewController.view.center = point;
                         CGFloat angle = ((CGFloat)arc4random_uniform(100) - 50.f) / 100.f;
                         formSheetController.presentedFSViewController.view.transform = CGAffineTransformMakeRotation(angle);
                     }
                     completion:^(BOOL finished) {
                         completionHandler();
                     }];
}
@end
