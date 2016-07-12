//
//  UIImage+RoundedRectImage.h
//  二维码生成测试
//
//  Created by wanbd on 16/7/12.
//  Copyright © 2016年 ES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedRectImage)

+ (UIImage *)createRoundedRectImage:(UIImage *)image withSize:(CGSize)size withRadius:(NSInteger)radius;

+ (UIImage *)generateBarCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;

@end
