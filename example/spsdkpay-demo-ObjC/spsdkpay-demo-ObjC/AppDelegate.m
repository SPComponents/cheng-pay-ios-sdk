//
//  AppDelegate.m
//  spsdkpay-demo-ObjC
//
//  Created by z on 2018/5/24.
//  Copyright © 2018年 super. All rights reserved.
//

#import "AppDelegate.h"
#import "SPSDKPay.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSDictionary* dict = @{
//                           @"channel" : @"wx",
//                           @"mode"  : @"APP"
//                           };
//    NSMutableURLRequest * postRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
//    NSData* data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *bodyData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    [postRequest setHTTPBody:[NSData dataWithBytes:[bodyData UTF8String] length:strlen([bodyData UTF8String])]];
//    [postRequest setHTTPMethod:@"POST"];
//    [postRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:postRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
//            if (httpResponse.statusCode != 200) {
//                NSLog(@"statusCode=%ld error = %@", (long)httpResponse.statusCode, error);
//                return;
//            }
//            if (error != nil) {
//                NSLog(@"error = %@", error);
//                return;
//            }
//            NSString* charge = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"charge = %@", charge);
//            [SPSDKPay createPayment:@"sigin=12323&order=xxxxx" paymentChannel:SPSDKPaymentChannelWX appURLScheme:@"supaysdk" withCompletion:^(NSDictionary *result, SPSDKPayError *error) {
//                NSLog(@"completion block: %@", result);
//                if (error == nil) {
//                    NSLog(@"Error is nil");
//                } else {
//                    NSLog(@"Error: code=%lu msg=%@", (unsigned  long)error.code, [error getMsg]);
//                }
//            }];
//        });
//    }];
//    [task resume];
    
    
    
    [SPSDKPay createPayment:@"" paymentChannel:SPSDKPaymentChannelUNinPay viewController:[UIViewController new] appURLScheme:@"supaysdk" withCompletion:^(NSDictionary *result, SPSDKPayError *error) {
        NSLog(@"completion block: %@", result);
        if (error == nil && [result[@"status"] unsignedIntegerValue] == 200) {
            NSLog(@"Success");
        } else {
            NSLog(@"Error: code=%lu msg=%@", (unsigned  long)error.code, [error getMsg]);
        }
    }];
    [SPSDKPay setDebugMode:YES];
    
    return YES;
}

// iOS 8 及以下请用这个
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [SPSDKPay handleOpenURL:url sourceApplication:sourceApplication withCompletion:nil];
}

// iOS 9 以上请用这个
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options {
    return [SPSDKPay handleOpenURL:url withCompletion:nil];
}

@end