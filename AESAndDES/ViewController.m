//
//  ViewController.m
//  AESAndDES
//
//  Created by apple on 16/12/1.
//  Copyright © 2016年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "DES3Util.h"
#import "AES.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *randomStr = [self shuffledAlphabet];

    //DES加密
    NSString *DESEncryptStr = [DES3Util encryptUseDES:@"王宇" key:randomStr];
    
    //DES解密
    NSString *DESDecryptStr = [DES3Util decryptUseDES:DESEncryptStr key:randomStr];
    
    NSLog(@"\n%@\n%@",DESEncryptStr,DESDecryptStr);
    
    //AES加密
    NSString *AESEncryptStr = [AES encrypt:@"康妮" password:randomStr];
    
    //AES解密
    NSString *AESDecryptStr = [AES decrypt:AESEncryptStr password:randomStr];
    
    NSLog(@"\n%@\n%@",AESEncryptStr,AESDecryptStr);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//生成八位随机字符串
- (NSString *)shuffledAlphabet {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform((float)numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:8];
    free(characters);
    return result;
}
@end
