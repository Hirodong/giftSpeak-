//
//  GiftModel.m
//  GiftSpeak
//
//  Created by dllo on 15/8/21.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel

- (void)dealloc
{
    [_id release];
    [_cover_image_url release];
    [_title release];
    [_share_msg release];
    [_short_title release];
    [_likes_count release];
    [_url release];
    [super dealloc];
    
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
