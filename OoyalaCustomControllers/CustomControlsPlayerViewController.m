/**
 * @class      CustomControlsPlayerViewController CustomControlsPlayerViewController.m "CustomControlsPlayerViewController.m"
 * @brief      A Player that shows how to implement custom controls within the OoyalaPlayer
 * @details    CustomControlsPlayerViewController in Ooyala Sample Apps
 * @date       12/12/14
 * @copyright  Copyright (c) 2014 Ooyala, Inc. All rights reserved.
 */


#import "CustomControlsPlayerViewController.h"
#import "CustomControlsViewController.h"
#import "AppDelegate.h"
#import <OoyalaSDK/OoyalaSDK.h>

/**
 * This player has code which utilizes our DefaultControlsSource for custom controls.
 * This example was built on 3.4.0, but will continue to be an example on how to use a custom ViewController for controls
 * In the Utils/Controls group, you can see the modified CustomControlsView and CustomControlsViewController.
 */
@interface CustomControlsPlayerViewController ()
@property (nonatomic, weak) IBOutlet UIView *playerView;
@property OOOoyalaPlayerViewController *ooyalaPlayerViewController;
@property NSString *embedCode;
@property NSString *nib;
@property NSString *pcode;
@property NSString *playerDomain;
@end

@implementation CustomControlsPlayerViewController{
    AppDelegate *appDel;
}

- (void)loadView {
    [super loadView];
//    [[NSBundle mainBundle] loadNibNamed:self.nib owner:self options:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pcode = @"c0cTkxOqALQviQIGAHWY5hP0q9gU";
    _playerDomain = @"http://www.ooyala.com";
    
    appDel = [[UIApplication sharedApplication] delegate];
    
    // Create Ooyala ViewController
    OOOoyalaPlayer *player = [[OOOoyalaPlayer alloc] initWithPcode:self.pcode domain:[[OOPlayerDomain alloc] initWithString:self.playerDomain]];
    self.ooyalaPlayerViewController = [[OOOoyalaPlayerViewController alloc] initWithPlayer:player];
    
    // Use our CustomControlsViewController as the InlineViewController
    [self.ooyalaPlayerViewController setInlineViewController:[[CustomControlsViewController alloc] initWithControlsType:OOOoyalaPlayerControlTypeInline player:self.ooyalaPlayerViewController.player overlay:nil delegate:self.ooyalaPlayerViewController]];
    
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector:@selector(notificationHandler:)
                                                 name:nil
                                               object:_ooyalaPlayerViewController.player];
    
    // In QA Mode , making textView visible
//    if(self.qaModeEnabled==YES){
//        self.textView.hidden = NO;
//        
//    }
    
    // Attach it to current view
    
    [self addChildViewController:_ooyalaPlayerViewController];
    [self.playerView addSubview:_ooyalaPlayerViewController.view];
    [self.ooyalaPlayerViewController.view setFrame:self.playerView.bounds];
    
    NSURL *videoURL =  [[NSBundle mainBundle] URLForResource:@"video"
                            withExtension:@"mp4"
                             subdirectory:@""];
    
    NSLog(@">>>> VIDEO %@", videoURL);
    
    OOStream *stream = [[OOStream alloc] initWithUrl:videoURL deliveryType:OO_DELIVERY_TYPE_MP4];
    OOUnbundledVideo *video = [[OOUnbundledVideo alloc] initWithUnbundledStreams:[NSArray arrayWithObjects:stream, nil]];
    [_ooyalaPlayerViewController.player setUnbundledVideo:video];
    
    // Load the video
//    [_ooyalaPlayerViewController.player setEmbedCode:self.embedCode];
    [_ooyalaPlayerViewController.player play];
}

- (void) notificationHandler:(NSNotification*) notification {
    
    // Ignore TimeChangedNotificiations for shorter logs
    if ([notification.name isEqualToString:OOOoyalaPlayerTimeChangedNotification]) {
        return;
    }
    
    NSString *message = [NSString stringWithFormat:@"Notification Received: %@. state: %@. playhead: %f count: %d",
                         [notification name],
                         [OOOoyalaPlayer playerStateToString:[self.ooyalaPlayerViewController.player state]],
                         [self.ooyalaPlayerViewController.player playheadTime], appDel.count];
    
    NSLog(@"%@",message);
    
    //In QA Mode , adding notifications to the TextView

    appDel.count++;
}

@end