//
//  getIPAddress.h
//  IonicPreview
//
//  Created by Nicholas Gartmann on 8/25/14.
//  Copyright (c) 2014 RokkinCat. All rights reserved.
//

#ifndef IonicPreview_getIPAddress_h
#define IonicPreview_getIPAddress_h

#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

@interface IPUtils : NSObject
+ (NSString *)getIPAddress;
@end

#endif
