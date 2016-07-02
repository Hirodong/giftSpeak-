//
//  StyleModel.h
//  GiftSpeak
//
//  Created by dllo on 15/8/25.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StyleModel : NSObject

@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) NSString *icon_url;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *cover_image_url;
@property (nonatomic, retain) NSNumber *likes_count;
@property (nonatomic, retain) NSString *title;

@end
