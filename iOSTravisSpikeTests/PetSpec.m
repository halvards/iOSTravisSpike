//
//  PetSpec.m
//  iOSTravisSpike
//
//  Created by Mai K Lam on 13/03/2014.
//  Copyright (c) 2014 mlam. All rights reserved.
//

#import <Kiwi.h>
#import "Pet.h"

SPEC_BEGIN(PetSpec)

describe(@"Pet", ^{
    context(@"when creating a new pet", ^{
        __block Pet *pet;
        
        beforeEach(^{
            pet = [[Pet alloc] init];
        });
        
        it(@"should exist", ^{
            [pet shouldNotBeNil];
        });
        
        it(@"should have default name as 'No Name'", ^{
            [[pet.name should] equal:@"Blah"];
        });
    });
});

SPEC_END