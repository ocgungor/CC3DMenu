//
//  HelloWorldLayer.m
//  CC3DMenu
//
//  Created by Oguzhan Gungor on 9/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        set = [[[NSMutableSet alloc] init] autorelease];
        
        
        Vector3D boxSize = vec(0.8f,0.8f,1.6f);
        Vector3D camera = vec(0.0f, 0.0f, 6.0f);
        
        
        
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, 1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, 1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, 1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, 1.5f, 0.0f) andCamera:camera andImageName:@"1"]];

        
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, 0.0f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, 0.0f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, 0.0f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, 0.0f, 0.0f) andCamera:camera andImageName:@"1"]];

        
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, -1.5f, 0.0f)  andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, -1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, -1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, -1.5f, 0.0f) andCamera:camera andImageName:@"1"]];

  

        for (id val in set) {
              [self addChild: (CC3DMenu *) val];
        }
        
	}
	return self;
}



- (void) dealloc
{
	[super dealloc];
}
@end
