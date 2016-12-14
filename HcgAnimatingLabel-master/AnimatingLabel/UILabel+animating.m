//
//  UILabel+animating.m
//  HcgAnimatingLabel-master
//
//  Created by 黄成钢 on 07/12/2016.
//  Copyright © 2016 chedaoshanqian. All rights reserved.
//

#import "UILabel+animating.h"

@implementation UILabel (animating)

CADisplayLink *_timer;
NSTimeInterval _lastUpdate;
CGFloat _progress;
CGFloat _duration;
updateBlock _update;
completionBlock _completion;


-(void)animateToValue:(double)value formatter:(NSNumberFormatter *)formatter {
    if (formatter) {
        formatter = formatter;
    } else {
        formatter = NSNumberFormatter.new;
//        formatter.minimumFractionDigits = 2;
        formatter.minimumIntegerDigits = 1;
    }
    NSString *text = self.text ? :[formatter stringFromNumber:@(0)];
    CGFloat number = text.doubleValue;
    CGFloat difference = value - number;
    [self animateWithToValue:value update:^(double progress) {
        self.text = [formatter stringFromNumber:@(number + difference * progress)];
    } completion:^{
        self.text = [formatter stringFromNumber:@(value)];
    }];
    
}

- (void)animateWithToValue:(double)value update:(updateBlock)update completion:(completionBlock)completion {
    _update = update;
    _completion = completion;
    _duration = 5.0;
    _lastUpdate = [NSDate timeIntervalSinceReferenceDate];
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick)];
    [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)tick {
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    _progress += now - _lastUpdate;
    _lastUpdate = now;
    if (_progress > _duration) {
        [_timer invalidate];
        _update(1);
        _timer = nil;
        _completion();
        return;
    }
    CGFloat t = _progress/_duration;
    double sign = -1;
    t = t * 2;
    if (t < 1){
        _update( 0.5 * pow(t, 2));
    } else {
        _update(sign * 0.5 * (pow(t - 2, 2) + sign * 2));
    }
}


@end
