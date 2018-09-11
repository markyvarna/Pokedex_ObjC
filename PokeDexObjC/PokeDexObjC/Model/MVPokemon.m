//
//  MVPokemon.m
//  PokeDexObjC
//
//  Created by Markus Varner on 9/11/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

#import "MVPokemon.h"

@implementation MVPokemon

//INIT MVPokemon OBJ
- (instancetype)initWithName: (NSString *)name identifier: (NSInteger)identifier abilities: (NSArray<NSString *> *)abilities
{
    //init as a subclass of the super class NSObject
    self = [super init];
    if (self)
    {
        //properties
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
        
    }
    //return initilialized instance of self
    return self;
}


@end

@implementation MVPokemon (JSONConvertible)

- (instancetype)initWIthDictionary: (NSDictionary<NSString *, id> *)dictionary
{
    
    //Coding Keys (basically)
    NSString *name = dictionary[@"name"];
    //Swift: let name = dictionary["name"] as? String
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    //Top Level : tap the first levels array of dictionaries
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    //this is saying if my name is not a dictionary return nil same goes for abilities
    if (![name isKindOfClass: [NSString class]] || ![abilitiesDictionaries isKindOfClass: [NSArray class]])
    {
        return nil;
    }
    
          NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    //2nd Level: for each dictionary in abilities dict define a name
          for (NSDictionary *dictionary in abilitiesDictionaries)
          {
              //3rd Level: - now we are in the bottom level dict we tap the ability key
              //Bottom Level - then the ability dicts key name
              NSString *abilityName = dictionary[@"ability"][@"name"];
              if (!abilityName) {continue; }
              [abilities addObject:abilityName];
          }
    
          return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
