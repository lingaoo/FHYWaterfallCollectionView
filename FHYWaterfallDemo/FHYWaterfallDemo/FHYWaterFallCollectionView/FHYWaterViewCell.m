//
//  FHYWaterViewCell.m
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/21.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import "FHYWaterViewCell.h"
#import "UIImageView+WebCache.h"

@implementation FHYWaterViewCell

- (void)setCellContent:(FHYWaterViewModel *)cellContent{
    _cellContent = cellContent;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:cellContent.imageUrlString]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
