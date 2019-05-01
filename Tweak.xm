//import AVFoundation and AudioServices for the Audio Player
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>

        @interface SBUIController : NSObject {
	
        }
            //declare needed variables
            +(id)sharedInstance;
            -(BOOL)isOnAC;
            -(BOOL)isFullyCharged;
            -(BOOL)isBatteryCharging;
        @end


        //Audio Player variable
        AVAudioPlayer *player;


        //Sound paths
        NSString *startUpPath = [[NSBundle bundleWithPath:@"/Library/Application Support/Animezing/"] pathForResource:@"startUp" ofType:@"caf"];
    	NSURL *startUpURL = [[NSURL alloc] initFileURLWithPath:startUpPath];

        NSString *chargingPath = [[NSBundle bundleWithPath:@"/Library/Application Support/Animezing/"] pathForResource:@"charging" ofType:@"caf"];
    	NSURL *chargingURL = [[NSURL alloc] initFileURLWithPath:chargingPath];

        NSString *unpluggedPath = [[NSBundle bundleWithPath:@"/Library/Application Support/Animezing/"] pathForResource:@"unplugged" ofType:@"caf"];
    	NSURL *unpluggedURL = [[NSURL alloc] initFileURLWithPath:unpluggedPath];

        NSString *fullyChargedPath = [[NSBundle bundleWithPath:@"/Library/Application Support/Animezing/"] pathForResource:@"fullyCharged" ofType:@"caf"];
    	NSURL *fullyChargedURL = [[NSURL alloc] initFileURLWithPath:fullyChargedPath];

        NSString *appKilledPath = [[NSBundle bundleWithPath:@"/Library/Application Support/Animezing/"] pathForResource:@"appKilled" ofType:@"caf"];
    	NSURL *appKilledURL = [[NSURL alloc] initFileURLWithPath:appKilledPath];


//hook springboard and declare functionality of the "applicationDidFinishLaunching:(id)application" function
%hook SpringBoard

//play sound when respring
- (void)applicationDidFinishLaunching:(id)application {

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:startUpURL error:nil];
        player.numberOfLoops = 0;
        player.volume = 1;
                
        [player play];

%orig;

}

%end

//hook sbuicontroller and declare new functionalities of the "playConnectedToPowerSoundIfNecessary" function
%hook SBUIController
-(void)playConnectedToPowerSoundIfNecessary {

    //if device gets connected to charger play sound
	if (self.isOnAC) {
		nil;

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:chargingURL error:nil];
        player.numberOfLoops = 0;
        player.volume = 1;
                
        [player play];
	
    //if device is not connected to charger or is getting uplugged from the charger play sound
	} else if (self.isOnAC == false) {

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:unpluggedURL error:nil];
        player.numberOfLoops = 0;
        player.volume = 1;
                
        [player play];

    } else {
        %orig;
    }

    //if device is fully charged (100%) play sound
    if (self.isFullyCharged == true) {

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:fullyChargedURL error:nil];
        player.numberOfLoops = 0;
        player.volume = 1;
                
        [player play];

    } else {
        %orig;
    }

}

%end

//hook SBMainDisplaySceneManager and declare new functionalities of the "_appKilledInAppSwitcher:(id)arg1" function
%hook SBMainDisplaySceneManager

//if any app gets killed play sound
-(void)_appKilledInAppSwitcher:(id)arg1 {

        player = [[AVAudioPlayer alloc] initWithContentsOfURL:appKilledURL error:nil];
        player.numberOfLoops = 0;
        player.volume = 1;
                
        [player play];

%orig;

}

%end