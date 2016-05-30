# Volume
改变手机的媒体音量,  把文字转换为声音


OC版本代码

```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MPMusicPlayerController *musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
//    musicPlayer.volume =
    
    [[MPMusicPlayerController applicationMusicPlayer] setVolume: 0.9];
    [self.view addSubview:({
        UIButton * addVolumeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 600, 50, 50)];
//        addVolumeButton.center = self.view.center;
        addVolumeButton.backgroundColor = [UIColor blueColor];
        addVolumeButton.titleLabel.text = @"addVolumeButton";
        [addVolumeButton addTarget:self action:@selector(addVolume) forControlEvents:UIControlEventTouchUpInside];
        addVolumeButton;
    })];
    MPVolumeView * view = [MPVolumeView new];
    view.frame = CGRectMake(100, 100, 300, 400);
     [self.view addSubview:view];
    
    
}


- (void)addVolume{
//    [[MPMusicPlayerController applicationMusicPlayer] setVolume: 1];
    [self setVolume:1];
}

- (void)setVolume: (float)value
{
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    UISlider* volumeViewSlider = nil;
    for (UIView *view in [volumeView subviews]){
        if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
            volumeViewSlider = (UISlider*)view;
            break;
        }
    }
    volumeView.showsVolumeSlider = NO;
    
    // retrieve system volume
    //float systemVolume = volumeViewSlider.value;
    
    // change system volume, the value is between 0.0f and 1.0f
    [volumeViewSlider setValue:value animated:NO];
    
    // send UI control event to make the change effect right now.
    [volumeViewSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    [volumeView sizeToFit];
}

```

