//
//  UILabel+animating.h
//  HcgAnimatingLabel-master
//
//  Created by 黄成钢 on 07/12/2016.
//  Copyright © 2016 chedaoshanqian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^updateBlock)(double);
typedef void(^completionBlock)(void);
@interface UILabel (animating)

-(void)animateToValue:(double)value formatter:(NSNumberFormatter *)formatter;

@end
