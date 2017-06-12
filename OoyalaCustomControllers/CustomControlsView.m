//
//  OOInlineIOS7ControlsView.m
//  OoyalaSDK
//
// Copyright (c) 2015 Ooyala, Inc. All rights reserved.
//

#import "CustomControlsView.h"

@interface CustomControlsView() {
}

@property (nonatomic) CGFloat playpauseScale;
@property (nonatomic) CGFloat ccScale;
@property (nonatomic) CGFloat fullscreenScale;
@property (nonatomic) UIBarButtonItem *fixedSpace;
@property (nonatomic) UIBarButtonItem *flexibleSpace;
@end

@implementation CustomControlsView
CAGradientLayer *gradient;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {

    // Setup all the constant for inline controls
    CGFloat width = self.bounds.size.width;
    CGRect navigationBarRect;
    if ([OOUIUtils isIpad]) {
      navigationBarRect = CGRectMake(0, self.bounds.size.height - 50, width, 50);
      _playpauseScale = 2.7;
      _ccScale = 3.0;
      _fullscreenScale = 4.0;
    } else {
      navigationBarRect = CGRectMake(0, self.bounds.size.height - 50, width, 50);
      _playpauseScale = 3.0;
      _ccScale = 4;
      _fullscreenScale = 3.0;
    }

    _fullscreenButtonShowing = YES;

    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;

    // Create control bar
    self.navigationBar = [[UIToolbar alloc] initWithFrame:navigationBarRect];
    self.navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    _navigationBar.tintColor = [UIColor whiteColor];
//    _navigationBar.backgroundColor = [UIColor redColor];
//      _navigationBar.translucent = NO;
//      _navigationBar.barStyle = UIBarStyleDefault;
//      _navigationBar.barTintColor = [UIColor blackColor];
    _fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];

    _flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    //InitializeButtons

    _playButton = [[OOPlayPauseButton alloc] initWithScale:_playpauseScale];
//      [_playButton setImage:[UIImage imageNamed:@"pause-btn"]];
    _closedCaptionsButton = [[OOClosedCaptionsButton alloc] initWithScale:_ccScale];

    _fullscreenButton = [[OOFullscreenButton alloc] initWithScale:_fullscreenScale];
      
//    [_fullscreenButton setImage:(UIImage * _Nullable)]
    
    _scrubberSlider = [[OOUIProgressSliderIOS7 alloc] initWithFrame:[self calculateScrubberSliderFrame]];
      
    _scrubberSlider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

      _scrubberSlider.scrubber.maximumTrackTintColor = [UIColor colorWithWhite:255 alpha:0.3];
    _slider = [[UIBarButtonItem alloc] initWithCustomView:_scrubberSlider];
      for(UIView *subView in [_scrubberSlider subviews]) {
          if([subView  isKindOfClass: [UILabel class]] ) {
              UILabel *label = (UILabel *)subView;
              [label setTextColor:[UIColor whiteColor]];
              [label setTextAlignment:NSTextAlignmentCenter];
              [label setFont: [UIFont fontWithName:@"HelveticaNeue" size:12.0]];
          }
          
          if([subView isKindOfClass:[OOBufferView class]]) {
              OOBufferView *bufferView = (OOBufferView *) subView;
              for(UIView *bufferSubView in [bufferView subviews]) {
                  NSLog(@">>> BufferSubview %@", [bufferSubView class]);
              }
          }
//          NSLog(@"------------------- --------------------------- ----------------------");
          
      }
    [self updateNavigationBar];
    [self addSubview:_navigationBar];
  }
  return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    NSLog(@">>> width %f - height %f", self.bounds.size.width, self.bounds.size.height);
    _navigationBar.frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 50);
    gradient.frame = _navigationBar.bounds;
    NSLog(@">>>Navigation bar bounds  x: %f, y: %f - width %f - height %f",_navigationBar.frame.origin.x, _navigationBar.frame.origin.y, _navigationBar.frame.size.width, _navigationBar.frame.size.height);

}

/**
 * Update navbar when someting is added or removed
 */
- (void) updateNavigationBar{
  NSMutableArray *items = [[NSMutableArray alloc] init];
  [items addObject:_flexibleSpace];

  [items addObject:_playButton];

  [items addObject:_slider];

  if (_closedCaptionsButtonShowing) {
    [items addObject:_closedCaptionsButton];
  }
//  [items addObject:_flexibleSpace];


  if (_fullscreenButtonShowing) {
    [items addObject:_fullscreenButton];
  }

  [items addObject:_flexibleSpace];

  [_navigationBar setItems:items animated:NO];
  _slider.customView.frame = [self calculateScrubberSliderFrame];
    NSLog(@"------------------- CUSTOM CONTROLS SCRUBBER SLIDER SUBVIEWS ----------------------");

    _scrubberSlider.scrubber.maximumTrackTintColor = [UIColor groupTableViewBackgroundColor];
    for(UIView *subView in [_scrubberSlider subviews]) {
        NSLog(@"%@", [subView class]);
//        if([subView isKindOfClass: [UIView class]]) {
//            subView.backgroundColor = [UIColor lightGrayColor];
//        }
        if([subView isKindOfClass: [UILabel class]] ) {
            UILabel *label = (UILabel *)subView;
            [label setTextColor:[UIColor whiteColor]];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setFont: [UIFont fontWithName:@"HelveticaNeue" size:12.0]];
            
        }
        
        if([subView isKindOfClass:[OOBufferView class]]) {
            OOBufferView *bufferView = (OOBufferView *) subView;
            NSLog(@"------------------- OOBufferView SUBVIEWS ----------------------");
            NSLog(@"%@", [bufferView subviews]);
//            bufferView.backgroundColor = [UIColor purpleColor];
//            bufferView.tintColor = [UIColor greenColor];
            
            for(UIView *bufferSubView in [bufferView subviews]) {
//                bufferSubView.backgroundColor = [UIColor blueColor];
                if([bufferView isKindOfClass: [OOCuePointsView class]]) {
                    OOCuePointsView *cuePointsView = (OOCuePointsView *)bufferSubView;
//                    cuePointsView.backgroundColor = [UIColor redColor];
                }
                NSLog(@">>> BufferSubview %@", [bufferSubView class]);
            }
            NSLog(@"------------------- --------------------------- ----------------------");

        }
        NSLog(@"------------------- --------------------------- ----------------------");


    }
    
    if(gradient == nil) {
        gradient = [CAGradientLayer layer];
    }
    
    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor];
    
    [_navigationBar.layer insertSublayer:gradient atIndex:0];

    [_navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [_navigationBar setTranslucent:YES];
    [_navigationBar setBarTintColor:[UIColor clearColor]];
//    self.backgroundColor = [UIColor whiteColor];
    [_navigationBar setBackgroundImage:[UIImage new]
                  forToolbarPosition:UIBarPositionAny
                          barMetrics:UIBarMetricsDefault];
    [_navigationBar setShadowImage:[UIImage new]
              forToolbarPosition:UIBarPositionAny];
    [self setNeedsLayout];
}


/**
 * Called when the navbar is updated, and after the views need to be layed out (layoutSubviews)
 */
-(CGRect)calculateScrubberSliderFrame {
  NSMutableArray *buttonList = [[NSMutableArray alloc] init];
  buttonList = [NSMutableArray arrayWithArray:_navigationBar.items];
  [buttonList removeObject:_slider];
  return [iOS7ScrubberSliderFraming
      calculateScrubberSliderFramewithButtons: buttonList
                                    baseWidth:_navigationBar.bounds.size.width];
}

- (void)setIsPlayShowing:(BOOL)showing {
  [_playButton setIsPlayShowing:showing];
}

- (void)setFullscreenButtonShowing:(BOOL)showing {
  if(_fullscreenButtonShowing == showing) return;
  _fullscreenButtonShowing = showing;
  [self updateNavigationBar];
}

- (void)setClosedCaptionsButtonShowing:(BOOL)showing {
  if(_closedCaptionsButtonShowing == showing) return;
  _closedCaptionsButtonShowing = showing;
  [self updateNavigationBar];
}

- (void)hide {
  _navigationBar.alpha = 0;
}

- (void)show {
  _navigationBar.alpha = 1;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
  for (UIView *view in self.subviews) {
    if (CGRectContainsPoint(view.frame, point)) {
      return YES;
    }
  }
  return NO;
}

- (void)changeDoneButtonLanguage:(NSString*)language {
  // Implement this method when inline button's language need to be changed with closed caption
}
@end
