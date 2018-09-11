//
//  MVPokemonController.m
//  PokeDexObjC
//
//  Created by Markus Varner on 9/11/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

#import "MVPokemonController.h"

//Base URL
static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation MVPokemonController

//Impliment: - Fetch Pokemon func

+ (void)fetchPokemonForSearchTerm: (NSString *)searchTerm completion: (void (^_Nullable)(MVPokemon *_Nullable))completion
{
    //this is checking to see if a completion exists and is not nil
    if (!completion)
    {
        completion = ^(MVPokemon *p) {};
    }
    
    //1) Build URL
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    //Append Path Components - lowercaseString is a func that makes the string lowercase
    NSURL *searchURL = [baseURL URLByAppendingPathComponent: [searchTerm lowercaseString]];
    
    //this prints the url to the console, absolute string return the url as a string
    NSLog([searchURL absoluteString]);
    
    //2) URLSession
    [[[NSURLSession sharedSession] dataTaskWithURL: searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //if error print error
        if (error)
        {
            NSLog(@"There was an error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        //if response print response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        //if there is data,
        if (data)
        {
            
            //Decode Data
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]])
            {
                NSLog(@"Error parsing the JSON : %@", error);
                completion(nil);
                return;
            }
            MVPokemon *pokemon = [[MVPokemon alloc] initWIthDictionary:dictionary];
            completion(pokemon);
        }
        
    }] resume];
    
    
}


@end
