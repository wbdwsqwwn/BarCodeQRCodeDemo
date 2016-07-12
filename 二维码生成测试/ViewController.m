//
//  ViewController.m
//  二维码生成测试
//
//  Created by wanbd on 16/7/12.
//  Copyright © 2016年 ES. All rights reserved.
//

#import "ViewController.h"
#import "KMQRCode.h"
#import "UIImage+RoundedRectImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgVQRCode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutUI {
    //用于生成二维码的字符串source
    NSString *source = @"1231313213213213313";
    
    //使用iOS 7后的CIFilter对象操作，生成二维码图片imgQRCode（会拉伸图片，比较模糊，效果不佳）
//    CIImage *imgQRCode = [KMQRCode createQRCodeImage:source];
    
    CIImage *imgQRCode = [KMQRCode createBarCodeImage:source];
    
    //使用核心绘图框架CG（Core Graphics）对象操作，进一步针对大小生成二维码图片imgAdaptiveQRCode（图片大小适合，清晰，效果好）
    UIImage *imgAdaptiveQRCode = [KMQRCode resizeQRCodeImage:imgQRCode
                                                    withSize:_imgVQRCode.frame.size.width];
    
    //默认产生的黑白色的二维码图片；我们可以让它产生其它颜色的二维码图片，例如：蓝白色的二维码图片
    imgAdaptiveQRCode = [KMQRCode specialColorImage:imgAdaptiveQRCode
                                            withRed:255.0
                                              green:0.0
                                               blue:0.0]; //0~255
    
    //使用核心绘图框架CG（Core Graphics）对象操作，创建带圆角效果的图片
    UIImage *imgIcon = [UIImage createRoundedRectImage:[UIImage imageNamed:@"QRCode"]
                                              withSize:CGSizeMake(70.0, 93.0)
                                            withRadius:10];
    //使用核心绘图框架CG（Core Graphics）对象操作，合并二维码图片和用于中间显示的图标图片
    imgAdaptiveQRCode = [KMQRCode addIconToQRCodeImage:imgAdaptiveQRCode
                                              withIcon:imgIcon
                                          withIconSize:imgIcon.size];
    
    //    imgAdaptiveQRCode = [KMQRCode addIconToQRCodeImage:imgAdaptiveQRCode
    //                                              withIcon:imgIcon
    //                                             withScale:3];
    
    _imgVQRCode.image = imgAdaptiveQRCode;
    //设置图片视图的圆角边框效果
    _imgVQRCode.layer.masksToBounds = YES;
    _imgVQRCode.layer.cornerRadius = 10.0;
    _imgVQRCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imgVQRCode.layer.borderWidth = 4.0;
}

@end
