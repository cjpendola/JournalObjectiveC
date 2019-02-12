//
//  EntryController.h
//  JournalC
//
//  Created by Carlos Pendola on 2/11/19.
//  Copyright © 2019 Carlos Pendola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMEntry.h"


@interface DVMEntryController : NSObject

// MARK: - Properties
+ (DVMEntryController *)sharedController;

@property (nonatomic, strong) NSMutableArray<DVMEntry*> *entries;  //entries : [DMVEntry] = []

// MARK: - Methods
- (void)addEntry:(DVMEntry *)entry;

- (void)removeEntry:(DVMEntry *)entry;

- (void)modifyEntry:(DVMEntry *)entry withTitle:(NSString *)title text:(NSString *)text;

- (void)saveToPersistentStorage;

- (void)loadFromPersistentStorage;

@end


