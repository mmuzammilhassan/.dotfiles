//search when do /* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

/* Size of the window border */
static unsigned int border_width = 1;

static int topbar = 0;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
     // "FiraCode:semibold:size=16",
 "JetBrainsMono Nerd Font Mono:style=Bold:pixelsize=20:antialias=true:autohint=true",
    "JoyPixels:pixelsize=18:antialias=true:autohint=true"
};
static const unsigned int bgalpha = 0x99;
//static const unsigned int bgalpha = 0xe0;
// 0.9 × 255 = 229.5 → round to 230 → hex = 0xE6
static const unsigned int fgalpha = OPAQUE;
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
static const unsigned int alphas[SchemeLast][2] = {
	/*		fgalpha		bgalphga	*/
	[SchemeNorm] = { fgalpha, bgalpha },
	[SchemeSel] = { fgalpha, bgalpha },
	[SchemeOut] = { fgalpha, bgalpha },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 6;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
