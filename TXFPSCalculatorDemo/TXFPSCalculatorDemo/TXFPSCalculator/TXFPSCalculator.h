//
//  TXFPSCalculator.h
//  TXScrollLabelViewDemo
//
//  Created by tingxins on 31/10/2016.
//  Copyright © 2016 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TXFPSCalculator : NSObject

+ (instancetype)calculator;

- (instancetype)start;

- (void)end;

@end
