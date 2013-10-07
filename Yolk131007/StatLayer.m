//
//  StatLayer.m
//  Yolk131003
//
//  Created by Sangwon Kim on 13. 10. 4..
//  Copyright 2013년 Butfollow. All rights reserved.
//

#import "StatLayer.h"


@implementation StatLayer

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    
    StatLayer *layer = [StatLayer node];
    
    [scene addChild: layer];
    
    return scene;
}


-(id) init
{
    if( (self=[super init]) ) {
        

    }
    return self;
}

- (void) dealloc
{
    //[super dealloc];
}

@end
