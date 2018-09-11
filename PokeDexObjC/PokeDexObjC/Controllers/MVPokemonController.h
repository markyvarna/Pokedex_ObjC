//
//  MVPokemonController.h
//  PokeDexObjC
//
//  Created by Markus Varner on 9/11/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

//this import syntax means its a framework
#import <Foundation/Foundation.h>
//when we import something in "" its going to be for our own proj
#import "MVPokemon.h"

//note: this means to assume everything is not going to be _Nullable unless stated in by developer
NS_ASSUME_NONNULL_BEGIN

@interface MVPokemonController : NSObject

//Define Action: - FetchPokemon func

//note: ^ indicates that this is a closure, and _Nullable means when it is bridged into swift it is going to be an optional property
//Swift: static func fetch{Pokemon(for serachTerm: String, completion: ((MVPokemon?)-> Void)
+ (void)fetchPokemonForSearchTerm: (NSString *)searchTerm completion: (void (^_Nullable)(MVPokemon *_Nullable))completion;



@end

NS_ASSUME_NONNULL_END
