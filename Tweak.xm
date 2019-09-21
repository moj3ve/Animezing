#import <AudioToolbox/AudioServices.h>

        @interface SBUIController : NSObject {
	
        }

            -(BOOL)isOnAC;

        @end


%hook SpringBoard

//play sound when respring
- (void)applicationDidFinishLaunching:(id)application {

%orig;
SystemSoundID sound = 0;
AudioServicesDisposeSystemSoundID(sound);
AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/respring.caf"]), &sound);
AudioServicesPlaySystemSound((SystemSoundID)sound);
}

%end

%hook SBCoverSheetPrimarySlidingViewController

//play sound when unlocked
- (void)viewWillDisappear:(BOOL)arg1 {

    %orig;
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/unlock.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);

}

%end

//play sound when locked
%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/lock.caf"]), &sound);
    AudioServicesPlaySystemSound((SystemSoundID)sound);

}

%end

%hook SBUIController

-(void)playConnectedToPowerSoundIfNecessary {

    //if device gets connected to charger play sound
	if (self.isOnAC) {
		nil;

    %orig;
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/pluggedIn.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);
	
    //if device is not connected to charger or is getting uplugged from the charger play sound
	} else if (!(self.isOnAC)) {


    %orig;
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/unplugged.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);
    }
}

%end

%hook SBMainDisplaySceneManager

//if any app gets killed play sound
-(void)_appKilledInAppSwitcher:(id)arg1 {

    %orig;
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/appKilled.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);

}

%end