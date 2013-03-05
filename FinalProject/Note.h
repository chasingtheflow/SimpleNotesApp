//
//  Note.h
//  FinalProject
//
//  Created by Billy Matthews on 4/29/11.
//  Copyright (c) 2011 Bucknell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * noteData;
@property (nonatomic, retain) NSString * noteName;

@end
