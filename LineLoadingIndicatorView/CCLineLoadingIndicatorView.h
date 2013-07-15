@interface CCLineLoadingIndicatorView : UIView
@property (nonatomic, strong, readonly) UIView *progressView;
- (void)animateOnceWithDuration:(NSTimeInterval)duration;
@end
