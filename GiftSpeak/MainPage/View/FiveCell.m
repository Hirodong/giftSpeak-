//
//  FiveCell.m
//  GiftSpeak
//
//  Created by dllo on 15/9/1.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "FiveCell.h"
#import "FoodCell.h"
#import "FoodModel.h"
#import "DefineURL.h"
#import "AsynURLConnection.h"
#import "UIImageView+WebCache.h"
#import "ReHeight.pch"


@interface FiveCell () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) NSMutableArray *tableArr;

@end
@implementation FiveCell

/**
 *  美食cell(铺tableView)
 */
- (void)dealloc
{
    [_table release];
    [_tableArr release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableArr = [NSMutableArray array];
        [self myConnection];
        [self createTable];
    }
    return self;
}
- (void)myConnection
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"20" forKey:@"limit"];
    [dic setObject:@"0" forKey:@"offset"];
    
    [AsynURLConnection asynWithURL:LWS_Food parmaters:dic block:^(NSData *data) {
        
        [self.tableArr removeAllObjects];
        NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dict = [root objectForKey:@"data"];
        NSArray *array = [dict objectForKey:@"items"];
        
        for (NSDictionary *dic in array) {
            FoodModel *model = [[FoodModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.tableArr addObject:model];
            [model release];
        }
        [self.table reloadData];
    }];
}
- (void)createTable
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 * OffHeight, self.contentView.frame.size.width, self.contentView.frame.size.height) style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_table];
    _table.dataSource = self;
    _table.delegate = self;
    _table.rowHeight = 160 * OffHeight;
    [_table release];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"food"];
    if (cell == nil) {
        cell = [[FoodCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"food"];
    }
    
    FoodModel *model = [self.tableArr objectAtIndex:indexPath.row];
    [cell.mainImage sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:[UIImage imageNamed:@"ZhanWei.jpg"]];
    cell.titleLabel.text = model.title;
    NSString *string = [NSString stringWithFormat:@"%@", model.likes_count];
    cell.likeLabel.text = string;
    cell.selected = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodModel *model = [self.tableArr objectAtIndex:indexPath.row];

    [self.target performSelector:self.action withObject:model.url];
    
}
@end
