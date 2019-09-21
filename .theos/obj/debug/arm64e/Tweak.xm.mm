#line 1 "Tweak.xm"
#import <AudioToolbox/AudioServices.h>

        @interface SBUIController : NSObject {
	
        }

            -(BOOL)isOnAC;

        @end



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBCoverSheetPrimarySlidingViewController; @class SBMainDisplaySceneManager; @class SpringBoard; @class SBUIController; @class SBSleepWakeHardwareButtonInteraction; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); 

#line 12 "Tweak.xm"



static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {

_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
SystemSoundID sound = 0;
AudioServicesDisposeSystemSoundID(sound);
AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/respring.caf"]), &sound);
AudioServicesPlaySystemSound((SystemSoundID)sound);
}






static void _logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/unlock.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);

}






static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/lock.caf"]), &sound);
    AudioServicesPlaySystemSound((SystemSoundID)sound);

}





static void _logos_method$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

    
	if (self.isOnAC) {
		nil;

    _logos_orig$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary(self, _cmd);
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/pluggedIn.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);
	
    
	} else if (!(self.isOnAC)) {


    _logos_orig$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary(self, _cmd);
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/unplugged.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);
    }
}






static void _logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

    _logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);
    SystemSoundID sound = 0;
    AudioServicesDisposeSystemSoundID(sound);
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Animezing/appKilled.caf"]), &sound);
		AudioServicesPlaySystemSound((SystemSoundID)sound);

}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);Class _logos_class$_ungrouped$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);Class _logos_class$_ungrouped$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound);Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(playConnectedToPowerSoundIfNecessary), (IMP)&_logos_method$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary, (IMP*)&_logos_orig$_ungrouped$SBUIController$playConnectedToPowerSoundIfNecessary);Class _logos_class$_ungrouped$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$_ungrouped$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);} }
#line 97 "Tweak.xm"
