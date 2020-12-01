//
//  Target_EZWeChatManager.h
//  EZWechatManager
//
//  Created by 陈诚 on 2020/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_EZWeChatManager : NSObject

- (id)Action_WeChatInit:(NSDictionary *)params;

- (id)Action_WeChatLogin:(NSDictionary *)params;

- (id)Action_isWeiXinInstall:(NSDictionary *)params;

- (id)Action_shareImage:(NSDictionary *)params;

- (id)Action_pay:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
