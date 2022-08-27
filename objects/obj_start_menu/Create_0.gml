/// @description ?
change_music(mus_drone);
musLength = audio_sound_length(mus_drone);
menuOptions = ["Start", "Settings", "Exit"];
menuSelected = 0;
introAlpha = 1;
menuAlpha = 0;

state = STATES.INTRO;

fadeOut = false;
menu = false;
pulse = 0;
pulseChange = 0.001;
ac = animcurve_get_channel(ac_pulse, 0);