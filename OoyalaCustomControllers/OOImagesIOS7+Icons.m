//
//  OOImagesIOS7+Icons.m
//  OoyalaCustomControllers
//
//  Created by Raphael Araújo on 09/06/17.
//  Copyright © 2017 Raphael Araújo. All rights reserved.
//

#import "OOImagesIOS7+Icons.h"

@implementation OOImagesIOS7
+ (UIImage *)playImage {
    UIImage *play = [UIImage imageNamed:@"play-btn"];
    return play;
}


+ (UIImage *)pauseImage {
    UIImage *play = [UIImage imageNamed:@"pause-btn"];
    return play;
}

+ (UIImage *)playImage:(CGSize)size {
    UIImage *play = [UIImage imageNamed:@"play-btn"];
    return play;
}

+ (UIImage *)pauseImage:(CGSize)size {
    UIImage *pause = [UIImage imageNamed:@"pause-btn"];
    return pause;
}

+ (UIImage *)maximizeImage:(CGSize)size {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *)nextImage:(CGSize)size {
    return [UIImage imageNamed:@""];
}
+ (UIImage *)previousImage:(CGSize)size {
    return [UIImage imageNamed:@"pause-btn"];
}

+ (UIImage *)closedCaptionsImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *)expandImage {
    return [UIImage imageNamed:@"maximize-btn"];
}
+ (UIImage *)collapseImage {
    return [UIImage imageNamed:@"maximize-btn"];
}
+ (UIImage *)forwardImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *)rewindImage {
    return [UIImage imageNamed:@"pause-btn"];
}

+ (UIImage *)thumbImage {
    return [UIImage imageNamed:@"scrubberHandler"];
}
+ (UIImage *)routeImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *)routeOnImage {
    return [UIImage imageNamed:@"pause-btn"];
}

+ (UIImage *) castOffImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *) castOnImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *) castOn0Image {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *) castOn1Image {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *) castOn2Image {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *) volumeImage {
    return [UIImage imageNamed:@"pause-btn"];
}



@end
