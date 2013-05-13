//
//  AssetCell.m
//  Quotes
//
//  Created by Josh Barrow on 4/19/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "QuotesCell.h"

@implementation QuotesCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [[self imageView] setFrame:CGRectMake(10, 15, 65, 65)];
    
    [[self textLabel] setNumberOfLines:3];
    [[self textLabel] setBackgroundColor:[UIColor clearColor]];
    
    [[self detailTextLabel] setBackgroundColor:[UIColor clearColor]];
}

-(void)drawRect:(CGRect)aRect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    int lineWidth = 1;
	
    CGRect rect = [self bounds];
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
    miny -= 1;
	
    CGFloat locations[2] = { 0.0, 1.0 };
    CGColorSpaceRef cellColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef cellGradient = nil;
    CGFloat components[8] = { 1, 1, 1, 1, 0.866, 0.866, 0.866, 1};
    CGContextSetStrokeColorWithColor(c, [[UIColor grayColor] CGColor]);
    CGContextSetLineWidth(c, lineWidth);
    CGContextSetAllowsAntialiasing(c, YES);
    CGContextSetShouldAntialias(c, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, minx, miny);
	CGPathAddLineToPoint(path, NULL, maxx, miny);
	CGPathAddLineToPoint(path, NULL, maxx, maxy);
	CGPathAddLineToPoint(path, NULL, minx, maxy);
	CGPathAddLineToPoint(path, NULL, minx, miny);
	CGPathCloseSubpath(path);
    
	CGContextSaveGState(c);
	CGContextAddPath(c, path);
	CGContextClip(c);
    
	cellGradient = CGGradientCreateWithColorComponents(cellColorspace, components, locations, 2);
	CGContextDrawLinearGradient(c, cellGradient, CGPointMake(minx,miny), CGPointMake(minx,maxy), 0);
    
    CGColorSpaceRelease(cellColorspace);
    CGGradientRelease(cellGradient);
	CGContextAddPath(c, path);
	CGPathRelease(path);
	CGContextStrokePath(c);
	CGContextRestoreGState(c);
}

-(void)prepareForReuse
{
    [super prepareForReuse];
}

@end
