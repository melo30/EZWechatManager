//
//  EZViewController.m
//  EZWechatManager
//
//  Created by melo30 on 11/26/2020.
//  Copyright (c) 2020 melo30. All rights reserved.
//

#import "EZViewController.h"
#import "EZWechatManager.h"

@interface EZViewController ()

@end

@implementation EZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/// 微信登录
- (IBAction)weChatLogin:(id)sender {
    [[EZWechatManager shareInstance] sendWeixinLoginRequestWithViewController:self resultBlock:^(NSDictionary * _Nonnull userInfo) {
        NSLog(@"登录信息 = %@",userInfo);
    }];
}

/// 微信分享
- (IBAction)weChatShare:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://img.manjiwang.com/upload/201707/24/2017072409494828621401515.jpg"];
    [[EZWechatManager shareInstance] shareToSceneTimelineWithTitle:@"我是标题" content:@"我是内容" url:@"http://wap.manjiwang.com/details/details?articleId=315789" image:@"http://img.manjiwang.com/upload/201711/17/201711171623031520ca1c10506f584eafa4a98795d284f0d5.jpg"];
}

/// 分享视频
- (IBAction)shareVideoEvent:(id)sender {
    [[EZWechatManager shareInstance] shareVideoWithTitle:nil description:nil videoUrl:@"http://vod.manjiwang.com/51b43a0fa7574e07a0aaa65dfcabe5c3/82501ac650df4c68ab08639c9473aad4-37365dfac37d058be4e6ee09927b39f3-sd.mp4" videoLowBandUrl:nil thumbImage:@"https://pics4.baidu.com/feed/f9dcd100baa1cd11d8b169bf2d9a91fbc2ce2dbd.png?token=5d8fe5e8915b2f4e2ca1dc335f6b2373" scene:1 completion:nil];
}

- (IBAction)weChatPay:(id)sender {
    [[EZWechatManager shareInstance] payForWechat:@"wx6dbb1766bceac977" partnerId:@"1507996381" prepayId:@"wx141432539122983663b120813786119568" nonceStr:@"596858390" timeStamp:@"1550125969" package:@"Sign=WXPay" sign:@"6362347FE7F50258AB858981E2FC4204" viewController:self resultBlock:^(NSNumber * _Nonnull errCode) {
    }];
}

- (IBAction)imageShareEvent:(id)sender {
    [[EZWechatManager shareInstance] shareToImage:@"http://d.hiphotos.baidu.com/zhidao/pic/item/6a63f6246b600c334c3e91cb1e4c510fd9f9a16a.jpg" scene:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
