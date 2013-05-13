//
//  ShadowTableView.m
//  Quotes
//
//  Created by Josh Barrow on 4/29/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "ShadowTableView.h"

#define SHADOW_HEIGHT 20.0
#define SHADOW_INVERSE_HEIGHT 10.0
#define SHADOW_RATIO (SHADOW_INVERSE_HEIGHT / SHADOW_HEIGHT)

@interface ShadowTableView () {
    CAGradientLayer *originShadow;
    CAGradientLayer *topShadow;
    CAGradientLayer *bottomShadow;
}

@end

@implementation ShadowTableView

-(CAGradientLayer *)shadowAsInverse:(BOOL)inverse
{
	CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    
	CGRect newShadowFrame = CGRectMake(0, 0, self.frame.size.width, inverse ? SHADOW_INVERSE_HEIGHT : SHADOW_HEIGHT);
    
    [newShadow setFrame:newShadowFrame];
    
	UIColor *darkColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:inverse ? (SHADOW_INVERSE_HEIGHT / SHADOW_HEIGHT) * 0.5 : 0.5];
	UIColor *lightColor = [UIColor clearColor];
    
    [newShadow setColors:@[(inverse ? (id)[lightColor CGColor] : (id)[darkColor CGColor]), (inverse ? (id)[darkColor CGColor] : (id)[lightColor CGColor])]];
        
	return newShadow;
}

-(void)layoutSubviews
{
	[super layoutSubviews];
    
	if (!originShadow) {
		originShadow = [self shadowAsInverse:NO];
        
		[[self layer] insertSublayer:originShadow atIndex:0];
	}
	else if (![[[[self layer] sublayers] objectAtIndex:0] isEqual:originShadow]) {
		[[self layer] insertSublayer:originShadow atIndex:0];
	}
    
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    
	CGRect originShadowFrame = originShadow.frame;
    
	originShadowFrame.size.width = self.frame.size.width;
	originShadowFrame.origin.y = self.contentOffset.y;
	originShadow.frame = originShadowFrame;
    
	[CATransaction commit];
    
	NSArray *indexPathsForVisibleRows = [self indexPathsForVisibleRows];
    
	if ([indexPathsForVisibleRows count] == 0) {
		[topShadow removeFromSuperlayer];
		topShadow = nil;
        
		[bottomShadow removeFromSuperlayer];
		bottomShadow = nil;
        
		return;
	}
    
	NSIndexPath *firstRow = [indexPathsForVisibleRows objectAtIndex:0];
    
	if ([firstRow section] == 0 && [firstRow row] == 0) {
		UIView *cell = [self cellForRowAtIndexPath:firstRow];
		if (!topShadow) {
			topShadow = [self shadowAsInverse:YES];
		}
        
		CGRect shadowFrame = topShadow.frame;
		shadowFrame.size.width = cell.frame.size.width;
		shadowFrame.origin.y = -SHADOW_INVERSE_HEIGHT;
		topShadow.frame = shadowFrame;
	}
	else {
		[topShadow removeFromSuperlayer];
		topShadow = nil;
	}
    
	NSIndexPath *lastRow = [indexPathsForVisibleRows lastObject];
    
	if ([lastRow section] == [self numberOfSections] - 1 && [lastRow row] == [self numberOfRowsInSection:[lastRow section]] - 1) {
		UIView *cell = [self cellForRowAtIndexPath:lastRow];
        
		if (!bottomShadow) {
			bottomShadow = [self shadowAsInverse:NO];
			[[cell layer] insertSublayer:bottomShadow atIndex:0];
		}
		else if ([[[cell layer] sublayers] indexOfObjectIdenticalTo:bottomShadow] != 0) {
			[[cell layer] insertSublayer:bottomShadow atIndex:0];
		}
        
		CGRect shadowFrame = bottomShadow.frame;
        
		shadowFrame.size.width = cell.frame.size.width;
		shadowFrame.origin.y = cell.frame.size.height;
        
        [bottomShadow setFrame:shadowFrame];
	}
	else {
		[bottomShadow removeFromSuperlayer];
		bottomShadow = nil;
	}
}


@end