//
//  FHYWaterView.m
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/20.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import "FHYWaterView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@implementation FHYWaterView

- (instancetype)initWaterViewWithFrame:(CGRect)frame{
    EqualWidthLayOut *layout = [[EqualWidthLayOut alloc]init];
    self = (FHYWaterView *)[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    NSString *cellClassName = NSStringFromClass([FHYWaterViewCell class]);
    [self registerNib:[UINib nibWithNibName:cellClassName bundle:nil] forCellWithReuseIdentifier:cellClassName];
    return self;
}

@end
