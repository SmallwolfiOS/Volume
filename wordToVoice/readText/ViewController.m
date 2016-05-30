//
//  ViewController.m
//  readText
//
//  Created by Jason on 16/3/23.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *readBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _readBtn.layer.cornerRadius = _readBtn.frame.size.height/2;
    _readBtn.layer.masksToBounds = YES;
    _textField.text = @"高端大气上档次，低调奢华有内涵";
//    _textField.text = @"hello world";
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)readAvtion:(UIButton *)sender {
    
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:_textField.text];  //需要转换的文本
//    AVSpeechSynthesisVoice  * voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
//    utterance.voice = voice;
    utterance.volume = 0.1;//音量
//    utterance.rate = 0.5;//速度
//    utterance.pitchMultiplier = 1;//音调
    [av speakUtterance:utterance];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
