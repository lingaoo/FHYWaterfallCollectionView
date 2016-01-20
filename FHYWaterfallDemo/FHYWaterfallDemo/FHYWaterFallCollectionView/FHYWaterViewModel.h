//
//  FHYWaterViewModel.h
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/21.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FHYWaterViewModel : NSObject

@property (copy, nonatomic) NSString *imageUrlString;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

- (instancetype)initWithUrlString:(NSString *)urlString imageWidth:(CGFloat) imageWidth andImageHeight:(CGFloat)imageHeight;

@end
