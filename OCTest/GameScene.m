//
//  GameScene.m
//  OCTest
//
//  Created by BenJames on 2014-11-10.
//  Copyright (c) 2014年 BenJames. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
    
    //SKTexture * texture = [SKTexture textureWithImageNamed:@"wood"];
    
    
    SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"wood"];
    
    CGPoint Zero = CGPointZero;
    
    NSLog(@"---%@",[NSValue valueWithCGSize:backPic.size]);
    
    NSLog(@"---%@",[NSValue valueWithCGSize:[UIScreen mainScreen].bounds.size]);
    backPic.xScale = 1;
    backPic.yScale = 1;
    backPic.anchorPoint = CGPointMake(0, 0);
//    backPic.size = CGSizeMake(640, 1136);
//    backPic.position = Zero;
    CGRect bp = CGRectMake(0, 0, 640, 1136);
    backPic.size = bp.size;
    backPic.position = bp.origin;
    NSLog(@"---%@",[NSValue valueWithCGSize:backPic.size]);
    
    [self addChild:backPic];
    
    int maxX = 9;
    int maxY = 9;
    int dx = 120;
    int dy = 100;
    for (int j=0; j<maxY; j++) {
        for(int i=0; i<maxX; i++)
        {
            SKLabelNode *numLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
            numLabel.text = [NSString stringWithFormat:@"%d",i+1];
            numLabel.fontSize = 30;
            numLabel.position = CGPointMake(dx+50*i, dy+50*j);
            [self addChild:numLabel];
        }
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        NSLog(@"%f,%f", location.x, location.y);
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
