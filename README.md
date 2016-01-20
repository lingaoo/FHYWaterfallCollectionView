# FHYWaterfallCollectionView
A WaterfallCollectionViewDemo
简便集成一个瀑布流图片效果的Demo
本来想做成一个控件，但看起来并没达成。
不过可以在50行左右代码集成出一个瀑布流效果图吧。
六部完成瀑布流。

# 第一步：引入申明文件
    import "FHYWaterView.h"

# 第二步：遵循三个协议
    @interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, EqualWidthLayOutDelegate>

# 第三步 初始化一个FHYWaterView
    self.waterView = [[FHYWaterView alloc] initWaterViewWithFrame:self.view.bounds];
    EqualWidthLayOut *layOut = (EqualWidthLayOut *)self.waterView.collectionViewLayout;
    [layOut setDelegate:self];
    [self.waterView setDelegate:self];
    [self.waterView setDataSource:self];
    [self.view addSubview:_waterView];


# 第四步：返回FHYWaterViewCell类型的Cell
    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
        FHYWaterViewModel *cellContent = self.contentArray[indexPath.row];
        FHYWaterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FHYWaterViewCell class]) forIndexPath:indexPath];
        [cell setCellContent:cellContent];
        return cell;
    }

# 第五步：从网络获取数据并转换成WaterView需要的Model
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



# 第六步：执行代理方法
    - (CGFloat)collectionView:(UICollectionView *)view layout:(EqualWidthLayOut *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
        FHYWaterViewModel *dataModel = [self.contentArray objectAtIndex:indexPath.row];
        CGFloat kCellWidth = (kWidth - 10 * 3) / 2;
        return kCellWidth * ( dataModel.height / dataModel.width );
    }
