//
//  main.m
//  GyampApp
//
//  Created by Toshiyuki Masui on 11/05/28.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
