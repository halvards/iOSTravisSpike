//
//  Pet.m
//  iOSTravisSpike
//
//  Created by Mai K Lam on 13/03/2014.
//  Copyright (c) 2014 mlam. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (NSString *)name {
    if (!_name) {
        _name = @"No Name";
    }
    
    return _name;
}

@end
