//
//  UIImage+ImageCompress.m
//  UIIImageCompressExample
//
//  Created by Abraham Kuri on 12/12/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "UIImage+ImageCompress.h"


@implementation UIImage (ImageCompress)

+ (NSData *)compressImage:(UIImage *)image
            compressRatio:(CGFloat)ratio
{
    return [[self class] compressImage:image compressRatio:ratio maxCompressRatio:0.3f];
}

+ (NSData *)compressImage:(UIImage *)image
            compressRatio:(CGFloat)ratio maxSize:(int)size
{
    return [[self class] compressImage:image compressRatio:ratio maxCompressRatio:0.3f maxSize:size];
}

+ (NSData *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio maxCompressRatio:(CGFloat)maxRatio{
     //int MAX_UPLOAD_SIZE = 5120000;
    return [self compressImage:image compressRatio:ratio maxCompressRatio:maxRatio maxSize:maxRatio];
}

+ (NSData *)compressImage:(UIImage *)image compressType:(ImageSize)type
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    //原图
    if (ImageSizeNomal==type) {
        return imageData;
    }
    long maxDataSize=0;
    int needSize=0;
    if (ImageSizeStandard == type) {
        maxDataSize = 300*1024;
        needSize = 1136;
    }else if(ImageSizeHight == type){
        maxDataSize = 600*1024;
        needSize = 1600;
    }else{
        
    }
    
    if (imageData.length>maxDataSize*.8) {
        long MaxSize = MAX(image.size.height, image.size.width);
        if (MaxSize > needSize) {
            CGFloat scale = needSize*1.0/MaxSize;
            CGSize size = CGSizeMake(scale*image.size.width, scale*image.size.height);
            image = [self scaleDown:image withSize:size];
        }
        
        imageData = UIImageJPEGRepresentation(image, 1.0);
//        NSLog(@"imageData.length=%d",imageData.length);
        if (imageData.length>maxDataSize) {
            CGFloat compression = 1.0;
            int compressionCount = 0;
            while ([imageData length] > maxDataSize*.9) {
                compression -= 0.1;
                imageData = UIImageJPEGRepresentation(image, compression);
                compressionCount++;
            }
//            NSLog(@"imageData.length=%d,compression == %f，compressionCount=%d",imageData.length,compression,compressionCount);
        }
        
    }
    return imageData;
}

+ (NSData *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio maxCompressRatio:(CGFloat)maxRatio maxSize:(int) size;
{
    
    int MAX_UPLOAD_SIZE = size;
    
    CGSize maxSize = CGSizeMake( 1600,1600);
    CGSize imageSize = image.size;
    CGSize newSize;
    UIImage* newImage = image;
   
    if (imageSize.width > maxSize.width  || imageSize.height > maxSize.height ) {
        CGFloat width = 0 ;
        CGFloat height = 0;
        if (imageSize.width > maxSize.width) {
            width = maxSize.width;
            height = maxSize.width/ imageSize.width  * imageSize.height;
            
            if (height > maxSize.height) {
                width = maxSize.height/height * width;
                height = maxSize.height;
            }
        }else{
            height =  maxSize.height;
            width = maxSize.height/imageSize.height * imageSize.width;
        }
        newSize = CGSizeMake(width, height);
         newImage = [self scaleDown:image withSize:newSize];
    }
    
     NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    if ([imageData length] > MAX_UPLOAD_SIZE ) {
        imageData = UIImageJPEGRepresentation(newImage, 1.0);
    }
    if ([imageData length] > MAX_UPLOAD_SIZE ) {
        CGFloat compression = 1.0;
        if ([imageData length]  > 100*1024) {
            if ([imageData length]  > 300*1024) {
                compression = 0.65;
            }else{
                compression =   1.0 - ([imageData length]-100*1024)*0.35/ (200*1024);
            }
        }
//        NSLog(@"compression == %f",compression);
        if (compression < 1.0) {
            imageData = UIImageJPEGRepresentation(image, compression);
            while ([imageData length] > MAX_UPLOAD_SIZE ) {
                compression -= 0.10;
                imageData = UIImageJPEGRepresentation(image, compression);
//                NSLog(@"compression");
            }
        }
    }
    return  imageData;
}


+ (UIImage *)compressRemoteImage:(NSString *)url
                   compressRatio:(CGFloat)ratio
                maxCompressRatio:(CGFloat)maxRatio
{
    //Parse the URL
    NSURL *imageURL = [NSURL URLWithString:url];
    
    //We init the image with the rmeote data
    UIImage *remoteImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
    
    //Returns the remote image compressed
    return [[self class] compressImage:remoteImage compressRatio:ratio maxCompressRatio:maxRatio];
    
}

+ (UIImage *)compressRemoteImage:(NSString *)url compressRatio:(CGFloat)ratio
{
    return [[self class] compressRemoteImage:url compressRatio:ratio maxCompressRatio:0.1f];
}

+ (UIImage*)scaleDown:(UIImage*)image withSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContext(newSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
