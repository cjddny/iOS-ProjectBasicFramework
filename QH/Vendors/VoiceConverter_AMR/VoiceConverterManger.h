//
//  VoiceConverterManger.h
//  FunnyStore
//
//  Created by HuiYang on 14-9-23.
//  Copyright (c) 2014年 FunnyStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoiceConverterManger : NSObject

+ (int)amrToWav:(NSString*)_amrPath wavSavePath:(NSString*)_savePath;

+ (int)wavToAmr:(NSString*)_wavPath amrSavePath:(NSString*)_savePath;

@end
