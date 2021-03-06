//
//  Ad.m
//  Core Data Migration
//
//  Created by Nikita Pestrov on 05.04.13.
//  Copyright (c) 2013 easy ten. All rights reserved.
//

#import "Ad.h"


@implementation Ad

@dynamic publicationDate;
@dynamic adDescription;
@dynamic price;
@dynamic publisher;

+ (Ad *)initAdWithPrice:(int)price andDescription:(NSString *)description inManagedContext:(NSManagedObjectContext *)context
{
  Ad *newAd = [NSEntityDescription insertNewObjectForEntityForName:@"Ad" inManagedObjectContext:context];
  newAd.adDescription = description;
  newAd.price = @(price);
  newAd.publicationDate = [NSDate date];
  return newAd;

}
+ (NSArray *)allAdsInManagedContext:(NSManagedObjectContext *)context
{
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  request.entity = [NSEntityDescription entityForName:@"Ad" inManagedObjectContext:context];
  request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"publicationDate" ascending:YES]];
  NSError *error = nil;
  return [context executeFetchRequest:request error:&error];

}
@end
