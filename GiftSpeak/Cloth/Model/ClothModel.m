//
//  ClothModel.m
//  GiftSpeak
//
//  Created by dllo on 15/8/21.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ClothModel.h"

@implementation ClothModel

- (void)dealloc
{
    [_content_url release];
    [_cover_image_url release];
    [_id release];
    [_share_msg release];
    [_short_title release];
    [_title release];
    [_url release];
    [_likes_count release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end