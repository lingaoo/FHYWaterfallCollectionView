//
//  FHYWaterViewCell.h
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/21.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHYWaterViewModel.h"

@interface FHYWaterViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FHYWaterViewModel *cellContent;
@end
