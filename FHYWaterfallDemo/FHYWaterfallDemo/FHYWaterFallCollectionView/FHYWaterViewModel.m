//
//  FHYWaterViewModel.m
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/21.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import "FHYWaterViewModel.h"

@implementation FHYWaterViewModel

- (instancetype)initWithUrlString:(NSString *)urlString imageWidth:(CGFloat) imageWidth andImageHeight:(CGFloat)imageHeight{
    self = [super init];
    if (self) {
        _imageUrlString = urlString;
        _width = imageWidth;
        _height = imageHeight;
    }
    return self;
}

@end
