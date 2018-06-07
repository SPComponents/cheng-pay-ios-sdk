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
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SPSDKPay createPayment:@"partner=\"2088421584120261\"&out_trade_no=\"FI222222233356854180009006\"&subject=\"super-pay\"&body=\"super-pay\"&total_fee=\"1.00\"&notify_url=\"http://server-center:8480/fcw/server/ALIPAY10101-VS.htm\"&service=\"mobile.securitypay.pay\"&payment_type=\"1\"&_input_charset=\"utf-8\"&seller_id=\"2088421584120261\"&currency=\"AUD\"&forex_biz=\"FP\"&secondary_merchant_id=\"1000\"&secondary_merchant_name=\"SU IELTS\"&secondary_merchant_industry=\"8299\"&sign=\"EbEgZWBpTCqyhrK%2B7j4pvAkj7J06O37K2x3MM9SjM%2FNLSnVZxtJFM%2Bvg0x%2B91Gk0eP3YiyV09K7tCm2Rhm1CIMRYf6BaB3zNhNSCkJtU7jKGnzCJuwhqpxtr%2Fw3bzod%2FaUi2C4ATSCLIQWL43kH3sEvWvpGAhhdbKr0sc2eOmv8%3D\"&sign_type=\"RSA\""
 paymentChannel:SPSDKPaymentChannelAliPay viewController:[UIViewController new] appURLScheme:@"supaysdk" withCompletion:^(NSDictionary *result, SPSDKPayError *error) {
            NSLog(@"completion block: %@", result);
            if (error == nil && [result[@"status"] unsignedIntegerValue] == 200) {
                NSLog(@"Success");
            } else {
                NSLog(@"Error: code=%lu msg=%@", (unsigned  long)error.code, [error getMsg]);
            }
            
        }];
        [SPSDKPay setDebugMode:YES];
    });
    
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
