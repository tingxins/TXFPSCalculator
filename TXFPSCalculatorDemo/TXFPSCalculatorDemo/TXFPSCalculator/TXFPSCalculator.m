//
//  TXFPSCalculator.m
//  TXScrollLabelViewDemo
//
//  Created by tingxins on 31/10/2016.
//  Copyright © 2016 tingxins. All rights reserved.
//

#import "TXFPSCalculator.h"
#import "TXTimerProxy.h"

@interface TXFPSCalculator (){
    NSTimeInterval _lastTimestamp;
    NSInteger _count;
}

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (strong, nonatomic) NSTimer *timer;

@property (weak, nonatomic) UILabel *fpsLabel;

@end

@implementation TXFPSCalculator

static TXFPSCalculator *_fpsCalculator;

+ (instancetype)calculator {
    if (_fpsCalculator) return _fpsCalculator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fpsCalculator = [[TXFPSCalculator alloc] init];
    });
    return _fpsCalculator;
}

- (instancetype)init {
    if (self = [super init]) {
        [self addFPSLabel];
    }
    return self;
    
}

- (void)addFPSLabel {
    CGSize screenS = [UIScreen mainScreen].bounds.size;
    CGFloat fpsLabelW = 60;
    CGFloat fpsLabelH = 20;
    UILabel *fpsLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenS.width - fpsLabelW, fpsLabelH, fpsLabelW, fpsLabelH)];
    _fpsLabel = fpsLabel;
    _fpsLabel.font = [UIFont systemFontOfSize:14];
    _fpsLabel.backgroundColor = [UIColor redColor];
    _fpsLabel.textColor = [UIColor whiteColor];
    _fpsLabel.textAlignment = NSTextAlignmentCenter;
    _fpsLabel.layer.cornerRadius = 10;
    _fpsLabel.layer.masksToBounds = YES;
    _fpsLabel.text = @"0 FPS";
    
    [[UIApplication sharedApplication].keyWindow addSubview:_fpsLabel];
}

- (void)fpsCalculateWithDisplayLink:(CADisplayLink *)displayLink {
    
    if (!_lastTimestamp) {
        _lastTimestamp = displayLink.timestamp;
        return;
    }
    _count ++;
    CGFloat delta = displayLink.timestamp - _lastTimestamp;
    if (delta < 1) return;
    _lastTimestamp = displayLink.timestamp;
    CGFloat fps = _count/delta;
    _count = 0;
    
    _fpsLabel.text = [NSString stringWithFormat:@"%d FPS", (int)round(fps)];
}

- (instancetype)start {
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:[[TXTimerProxy alloc]initWithTarget:self] selector:@selector(fpsCalculateWithDisplayLink:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink = displayLink;
    
    return self;
}

- (void)end {
    /* 
     * 解除对self的强引用
     * Removes the object from all runloop modes (releasing the receiver if
     * it has been implicitly retained) and releases the 'target' object. 
     */
    [_fpsLabel removeFromSuperview];
    _fpsLabel = nil;
    [self.displayLink invalidate];
}

-(void)dealloc {
    NSLog(@"%s_%@", __func__, self.class);
    [self end];
}
@end
