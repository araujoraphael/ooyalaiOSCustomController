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
    UIImage *originalImage = [UIImage imageNamed:@"play-btn"];
    CGSize destinationSize = CGSizeMake(32, 38);
    UIGraphicsBeginImageContext(destinationSize);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
    UIImage *play = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
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
    UIImage *originalImage = [UIImage imageNamed:@"maximize-btn"];
    CGSize destinationSize = CGSizeMake(38, 36);
    UIGraphicsBeginImageContext(destinationSize);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
    UIImage *maximize = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return maximize;
}
+ (UIImage *)forwardImage {
    return [UIImage imageNamed:@"pause-btn"];
}
+ (UIImage *)rewindImage {
    return [UIImage imageNamed:@"pause-btn"];
}

+ (UIImage *)thumbImage {
    UIImage *originalImage = [UIImage imageNamed:@"scrubberHandler"];
    CGSize destinationSize = CGSizeMake(24, 24);
    UIGraphicsBeginImageContext(destinationSize);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return thumbImage;
}
+ (UIImage *)routeImage {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *)routeOnImage {
    return [UIImage imageNamed:@"line"];
}

+ (UIImage *) castOffImage {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *) castOnImage {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *) castOn0Image {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *) castOn1Image {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *) castOn2Image {
    return [UIImage imageNamed:@"line"];
}
+ (UIImage *) volumeImage {
    return [UIImage imageNamed:@"pause-btn"];
}



@end
