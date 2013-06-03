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
	CCScene *scene = [CCScene node];
	
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{

	if( (self=[super init])) {
		
        set = [[[[NSMutableArray alloc] init] retain] autorelease];
        
        
        Vector3D boxSize = vec(0.8f,0.8f,1.6f);
        Vector3D camera = vec(0.0f, 0.0f, 6.0f);
        
        

//        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, 1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
//        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, 1.5f, 0.0f) andCamera:camera andImageName:@"2"]];
//        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, 1.5f, 0.0f) andCamera:camera andImageName:@"3"]];
//        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, 1.5f, 0.0f) andCamera:camera andImageName:@"4"]];


        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, 0.0f, 0.0f) andCamera:camera andImageName:@"5"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, 0.0f, 0.0f) andCamera:camera andImageName:@"6"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, 0.0f, 0.0f) andCamera:camera andImageName:@"7"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, 0.0f, 0.0f) andCamera:camera andImageName:@"8"]];


        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-2.25f, -1.5f, 0.0f) andCamera:camera andImageName:@"1"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec(-0.75f, -1.5f, 0.0f) andCamera:camera andImageName:@"2"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 0.75f, -1.5f, 0.0f) andCamera:camera andImageName:@"3"]];
        [set addObject: [CC3DMenu threeDMenuWithSize:boxSize andPosition:vec( 2.25f, -1.5f, 0.0f) andCamera:camera andImageName:@"4"]];

  
        //arr = [set allObjects];

        for (id val in set) {
              [self addChild: (CC3DMenu *) val];
        }
        NSLog(@"count: %d", set.count);
        
        isAccelerometerEnabled_ = YES;
        
	}
	return self;
}


- (void) tick:(ccTime) dt;
{
    /*
     NSEnumerator *it;
     Box* box;// = [[[Box alloc] init] autorelease];
     
     while (set = [it nextObject]) {
     box = (Box*) it;
     
     if ([box getSelected]) {
     GLfloat height = [box getHeight];
     if (height > .1) {
     [box setHeight:height - .1f];
     }
     }
     }
     */
}

- (void) setCameraAngle: (Vector3D) angle;
{
    cameraAngle = angle;
}


- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
    float x = pow(acceleration.x * 2.0, 3);
    float y = pow(acceleration.y * 1.5, 2);
    
    
    if(acceleration.y < 0) y *= -1;

    for (id val in set) {
        [(CC3DMenu*) val setCamera:vec(y, x, 6.0f)];
    }  
}


- (void) dealloc
{
	[super dealloc];
}
@end
