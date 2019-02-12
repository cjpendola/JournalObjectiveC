//
//  Entry.h
//  JournalC
//
//  Created by Carlos Pendola on 2/11/19.
//  Copyright © 2019 Carlos Pendola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVMEntry : NSObject

// MARK: - Properties
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

// MARK: - Initialization
- (instancetype) initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;
@end

