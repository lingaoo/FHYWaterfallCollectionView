//
//  ViewController.m
//  FHYWaterfallDemo
//
//  Created by 付寒宇 on 16/1/20.
//  Copyright © 2016年 付寒宇. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define kTextUrlString @"http://chanyouji.com/api/attractions/35443/photos.json?per_page=20&page=1"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

//第一步：引入申明文件
#import "FHYWaterView.h"

//第二步：遵循三个协议
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, EqualWidthLayOutDelegate>
@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) FHYWaterView *waterView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpWaterView];
    [self getDataFromNet];
}

//初始化界面
- (void)setUpWaterView{
//第三步 初始化一个FHYWaterView
    self.waterView = [[FHYWaterView alloc] initWaterViewWithFrame:self.view.bounds];
    EqualWidthLayOut *layOut = (EqualWidthLayOut *)self.waterView.collectionViewLayout;
    [layOut setDelegate:self];
    [self.waterView setDelegate:self];
    [self.waterView setDataSource:self];
    [self.view addSubview:_waterView];
    self.contentArray = [NSMutableArray array];
}

#pragma mark UICollectionViewDelegate And UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.contentArray.count;
}


//第四步：返回FHYWaterViewCell类型的Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FHYWaterViewModel *cellContent = self.contentArray[indexPath.row];
    FHYWaterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FHYWaterViewCell class]) forIndexPath:indexPath];
    [cell setCellContent:cellContent];
    return cell;
}

//第五步：从网络获取数据并转换成WaterView需要的Model
- (void)getDataFromNet{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:kTextUrlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = (NSArray *)responseObject;
        for (NSDictionary *dataDictionary in dataArray) {
            //获取到数据后初始化模型并添加到数组中
            NSString *imageUrl = [dataDictionary objectForKey:@"image_url"];
            CGFloat imageWidth = [[dataDictionary objectForKey:@"image_width"] floatValue];
            CGFloat imageHeight = [[dataDictionary objectForKey:@"image_height"] floatValue];
            FHYWaterViewModel *cellContent = [[FHYWaterViewModel alloc] initWithUrlString:imageUrl imageWidth:imageWidth andImageHeight:imageHeight];
            [self.contentArray addObject:cellContent];
        }
        [_waterView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", kTextUrlString);
    }];
}



//第六步：执行代理方法
- (CGFloat)collectionView:(UICollectionView *)view layout:(EqualWidthLayOut *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    FHYWaterViewModel *dataModel = [self.contentArray objectAtIndex:indexPath.row];
    CGFloat kCellWidth = (kWidth - 10 * 3) / 2;
    return kCellWidth * ( dataModel.height / dataModel.width );
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
