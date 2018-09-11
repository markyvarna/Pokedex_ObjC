//
//  MVPokemon.h
//  PokeDexObjC
//
//  Created by Markus Varner on 9/11/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
//we need two pointers because one points to the array and the other to the abilities obj
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

//Define: - Initializer of MVPokemon Obj

//note: in the abilities param, we have one pointer "*" pointing to the array and thje other to the strings within it
- (instancetype)initWithName: (NSString *)name identifier: (NSInteger)identifier abilities: (NSArray<NSString *> *)abilities;


@end

@interface MVPokemon (JSONConvertible)
//id is similar to swifts data type Any
//Swift: init(withDictionary: [String : Any]) {
- (instancetype)initWIthDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
