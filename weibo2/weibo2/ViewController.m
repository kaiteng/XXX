//
//  ViewController.m
//  weibo2
//
//  Created by accenture iMac on 15-6-17.
//  Copyright (c) 2015年 Hardway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *key =@"3601604349";
    //      NSString *secret =@"7894dfdd1fc2ce7cc6e9e9ca620082fb";
    NSString *redirect = @"http://hi.baidu.com/jt_one";
    
    NSString *url = [NSString stringWithFormat:@"%@?client_id=%@&response_type=token&redirect_uri=%@", @"https://api.weibo.com/oauth2/authorize", key, redirect];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView setDelegate:self];
    [self.webView loadRequest:request];
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"能否加载--%@",webView.request.URL);
    
    BOOL resutl = [request.URL.absoluteString hasPrefix:@"http://hi.baidu.com/jt_one"];
    if (resutl) {
        NSArray  *a = [request.URL.absoluteString componentsSeparatedByString:@"#"];
       // NSString *b = [a objectAtIndex:1];
        NSString *b = [a objectAtIndex:1];
        NSArray  *c = [b componentsSeparatedByString:@"="];
        NSString *d = [c objectAtIndex:1];
        NSArray  *e = [d componentsSeparatedByString:@"&"];
        NSString *f = [e objectAtIndex:0];
        NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
        [userdefault setObject:f forKey:@"h"];
    }
    
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
