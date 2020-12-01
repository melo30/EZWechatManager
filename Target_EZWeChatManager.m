//
//  Target_EZWeChatManager.m
//  EZWechatManager
//
//  Created by 陈诚 on 2020/11/27.
//

#import "Target_EZWeChatManager.h"
#import "EZWechatManager.h"

typedef void (^loginResultBlock)(NSDictionary * info);
@implementation Target_EZWeChatManager

- (id)Action_WeChatInit:(NSDictionary *)params {
    NSString *appId = [params objectForKey:@"appId"];
    NSString *appSecret = [params objectForKey:@"appSecret"];
    NSString *universalLink = [params objectForKey:@"universalLink"];
    [[EZWechatManager shareInstance] initSDKWithAppId:appId appSecret:appSecret universalLink:universalLink];
    return nil;
}

- (id)Action_WeChatLogin:(NSDictionary *)params {
    UIViewController *viewController = [params objectForKey:@"viewController"];
    loginResultBlock block = [params objectForKey:@"completion"];
    [[EZWechatManager shareInstance] sendWeixinLoginRequestWithViewController:viewController resultBlock:^(NSDictionary * _Nonnull userInfo) {
        if (block) {
            block(userInfo);
        }
    }];
    return nil;
}

- (id)Action_isWeiXinInstall:(NSDictionary *)params {
    return @([[EZWechatManager shareInstance] isWeiXinInstall]);
}

- (id)Action_shareImage:(NSDictionary *)params {
    id image = [params objectForKey:@"image"];
    int scene = [[params objectForKey:@"scene"] intValue];
    [[EZWechatManager shareInstance] shareToImage:image scene:scene];
    return nil;
}

- (id)Action_shareVideo:(NSDictionary *)params {
    NSString *title = [params objectForKey:@"title"];
    NSString *description = [params objectForKey:@"description"];
    NSString *videoUrl = [params objectForKey:@"videoUrl"];
    NSString *videoLowBandUrl = [params objectForKey:@"videoLowBandUrl"];
    id thumbImage = [params objectForKey:@"thumbImage"];
    int scene = [[params objectForKey:@"scene"] intValue];
    id completion = [params objectForKey:@"completion"];
    [[EZWechatManager shareInstance] shareVideoWithTitle:title description:description videoUrl:videoUrl videoLowBandUrl:videoLowBandUrl thumbImage:thumbImage scene:scene completion:completion];
    return nil;
}

- (id)Action_pay:(NSDictionary *)params {
    NSString *openID = [params objectForKey:@"appid"];
    NSString *partnerId = [params objectForKey:@"partnerid"];
    NSString *prepayId = [params objectForKey:@"prepayid"];
    NSString *nonceStr = [params objectForKey:@"noncestr"];
    NSString *timeStamp = [params objectForKey:@"timestamp"];
    NSString *package = [params objectForKey:@"package"];
    NSString *sign = [params objectForKey:@"sign"];
    UIViewController *viewController = [params objectForKey:@"viewController"];
    id resultBlock = [params objectForKey:@"resultBlock"];
    [[EZWechatManager shareInstance] payForWechat:openID partnerId:partnerId prepayId:prepayId nonceStr:nonceStr timeStamp:timeStamp package:package sign:sign viewController:viewController resultBlock:resultBlock];
    return nil;
}
@end
