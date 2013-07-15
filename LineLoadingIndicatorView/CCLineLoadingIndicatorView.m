#import "CCLineLoadingIndicatorView.h"

@interface CCLineLoadingIndicatorView ()
@property (nonatomic, strong) UIView *progressView;
@end

@implementation CCLineLoadingIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressView = [[UIView alloc] initWithFrame:[self initialProgressViewFrame]];
        self.progressView.backgroundColor = [UIColor colorWithRed:82/255.0 green:190/255.0 blue:210/255.0 alpha:1];
        [self addSubview:self.progressView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.progressView.frame = CGRectOffset(self.bounds, -frame.size.width, 0);
}

- (CGRect)initialProgressViewFrame {
    return CGRectOffset(self.bounds, -self.frame.size.width, 0);
}

- (void)animateOnceWithDuration:(NSTimeInterval)duration {
    __weak CCLineLoadingIndicatorView *weakSelf = self;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseIn animations:^{
        weakSelf.progressView.frame = weakSelf.bounds;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.progressView.alpha = 0;
        } completion:^(BOOL finished) {
            weakSelf.progressView.frame = [weakSelf initialProgressViewFrame];
            weakSelf.progressView.alpha = 1;
        }];
    }];
}

@end
