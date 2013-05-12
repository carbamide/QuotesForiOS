//
//  Quote.h
//  Quotes
//
//  Created by Josh on 5/11/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Quote : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * quoteText;
@property (nonatomic, retain) NSString * source;

@end
