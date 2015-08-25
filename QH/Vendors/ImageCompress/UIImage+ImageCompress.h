//
//  UIImage+ImageCompress.h
//  UIIImageCompressExample
//
//  Created by Abraham Kuri on 12/12/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ImageSizeNomal, //原图
    ImageSizeHight, //高清图
    ImageSizeStandard //标准图
}ImageSize;

@interface UIImage (ImageCompress)

/**
 * EIM自定义压缩
 * @param type 0=标清,1高清
 */
+ (NSData *)compressImage:(UIImage *)image
            compressType:(ImageSize) type;

+ (NSData *)compressImage:(UIImage *)image
            compressRatio:(CGFloat)ratio maxSize:(int)size;
/**
 Compress a UIImage to the specified ratio
 
 @param image The image to compress
 @param ratio The compress ratio to compress to
 
 */
+ (NSData *)compressImage:(UIImage *)image
             compressRatio:(CGFloat)ratio;

/**
 Compress a UIImage to the specified ratio with a max ratio compression
 
 @param image The image to compress
 @param ratio The compress ratio to compress to
 @param maxRatio The maximum compression ratio for the image
 
 */
+ (NSData *)compressImage:(UIImage *)image
             compressRatio:(CGFloat)ratio
          maxCompressRatio:(CGFloat)maxRatio;

/**
 Compress a remote UIImage to the specified ratio with a max ratio compression
 
 @param url The remote image URL to compress
 @param ratio The compress ratio to compress to
 
 */
+ (UIImage *)compressRemoteImage:(NSString *)url
                   compressRatio:(CGFloat)ratio;

/**
 Compress a remote UIImage to the specified ratio with a max ratio compression
 
 @param url The remote image URL to compress
 @param ratio The compress ratio to compress to
 @param maxRatio The maximum compression ratio for the image
 
 */
+ (UIImage *)compressRemoteImage:(NSString *)url
                   compressRatio:(CGFloat)ratio
                maxCompressRatio:(CGFloat)maxRatio;

@end
