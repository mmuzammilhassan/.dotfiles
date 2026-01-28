/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* 1, 2, 3 border pixel of windows */
static const unsigned int gappx     = 30;       /* 4, 10 gaps between windows */
static const unsigned int snap      = 8;        /* 32 snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */

                                    /* this is bar font*/
//static const char *fonts[]          = { "FiraCode:medium:size=9", "JoyPixels:pixelsize=18:antialias=true:autohint=true"};
static const char *fonts[]          = { "JetBrainsMono Nerd Font Mono:style=Medium:pixelsize=12:antialias=true:autohint=true", "JoyPixels:pixelsize=12:antialias=true:autohint=true"};
// static const char *fonts[]          = { "FiraCode:medium:size=10", "JoyPixels:pixelsize=10:antialias=true:autohint=true"};

                                    /* this is dmenu font*/
static const char dmenufont[]       = "JetBrainsMono Nerd Font Mono:style=Bold:pixelsize=20:antialias=true:autohint=true";
static char normbgcolor[]           ="#222222";  // "#0a0410";  bar bg color
static char normbordercolor[]       ="#444444";  // "#798aaa";  unactive border
static char normfgcolor[]           ="#bbbbbb";  // "#9ccfd8";  bar fg color
static char selfgcolor[]            ="#eeeeee";  // "#9ccfd8";  selected color and left dot color
static char selbordercolor[]        ="#005577";  // "#00ffff"; 
static char selbgcolor[]            ="#005577";  // "#9ccfd8"; 
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
//static const char *tags[] = { "1","2","3", "4", "5", "6", "7", "8", "9"};
//static const char *tags[] = { "1t","2dr","3w", "4di", "5", "6", "7q", "8f", "9ch"};
//static const char *tags[] = { "1t","2q","3f", "4", "5", "6", "7c", "8", "9"};
//static const char *tags[] = { "", "", "", "", "", "", "", "", "", };
static const char *tags[] = { " ", "", "", " ", "", "", " ", };
//static const char *tags[] = { "", "", "", "", "", "", "", };
// static const char *tags[] = { " ", " ","",  " ", " ", " " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class        instance	title		tags mask  isfloating  isterminal  noswallow  monitor */
    { "TelegramDesktop",    NULL,     NULL,           0,         1,          0,           0,        -1 },
    { "obs",                NULL,     NULL,           0,         1,          0,           0,        -1 },
    { "Lutris",             NULL,     NULL,           0,         1,          0,           0,        -1 },
    // { "qutebrowser",	    NULL,     NULL,           1 << 0,    0,          0,          -1,        -1 },
    //{ "Brave",   	    NULL,     NULL,           1 << 1,    0,          0,          -1,        -1 },
    // { "Chromium",   	    NULL,     NULL,           1 << 0,    0,          0,          -1,        -1 },
    // { "firefox",   	    NULL,     NULL,           1 << 1,    0,          0,          -1,        -1 },
    // { "SQLiteBrowser",	    NULL,     NULL,           1 << 2,    0,          0,          -1,        -1 },
    //{ "code",             NULL,     NULL,           1 << 4,    0,          0,          -1,        -1 },
    // { "beekeeper-studio",   NULL,     NULL,           1 << 5,    0,          0,          -1,        -1 },
    { "St",                 NULL,     NULL,           0,         0,          1,           0,        -1 },
    { NULL,		    NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
//static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont}; // that one is old
static const char *dmenucmd[] = { "dmenu_run", "-c", "-l", "10", NULL};
static const char *dmenubluetoothcmd[] = { "dmenu-bluetooth", "-c", "-l", "10", NULL};
static const char *termcmd[]  = { "st", NULL };
/* this is for slock */
static const char *slockcmd[] = { "slock", NULL };

/* * sh -c is required to expand the date command.
 * We use .png because it is better for text/code clarity than .jpg 
 */
/* SCREENSHOT COMMANDS */
// 1. Full Screen (Save Only) - Simple and fast
static const char *printscr[] = { "sh", "-c", "maim ~/pix/sss/$(date '+%y%m%d-%H%M-%S').png", NULL };
// 2. Select Area (Save Only) - Simple and fast
static const char *printsel[] = { "sh", "-c", "maim -s ~/pix/sss/$(date '+%y%m%d-%H%M-%S').png", NULL };

// 3. Select Area (Save + Copy) - Best for sharing specific code/errors
static const char *printclip[] = { "sh", "-c", "f=~/pix/sss/$(date '+%y%m%d-%H%M-%S').png; maim -s \"$f\" && xclip -selection clipboard -t image/png < \"$f\"", NULL };
// 4. Full Screen (Save + Copy) - Best for sharing full layouts
static const char *printclipcopy[] = { "sh", "-c", "f=~/pix/sss/$(date '+%y%m%d-%H%M-%S').png; maim \"$f\" && xclip -selection clipboard -t image/png < \"$f\"", NULL };

/* Mod + p (printscr): Quick full-screen snap. No questions asked. Simple.
 * Mod + Shift + p (printsel): The "Precision Tool." You select exactly what you want.
 * Mod + y (printclip): The "Precision Tool." You select exactly what you want, and it’s ready to paste into Discord/Slack immediately.
 * Mod + Shift + y (printclipcopy): The "I need to show everything right now" tool. Captures the whole desktop and copies it.
 *
 * 1. Sets a filename variable ($f).
 * 2. Runs maim. If you cancel, maim returns an error code.
 * 3. The '&&' ensures xclip ONLY runs if maim succeeded.
 * 4. We read the file back into xclip using '<'.
 */

static Key keys[] = {
	/* modifier                     key        function        argument */
    // argument index is important make sure it is correct like 1,2,3 counting Wise
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_7,                      4)
	TAGKEYS(                        XK_8,                      5)
	TAGKEYS(                        XK_9,                      6)
//	TAGKEYS(                        XK_8,                      7)
//	TAGKEYS(                        XK_9,                      8)

	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_g,      togglebar,      {0} },
	{ MODKEY,                       XK_f,	   zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_D,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_S,      incnmaster,     {.i = +1 } },
	{ MODKEY,		        XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_r,  	   togglefloating, {0} },
	{ MODKEY,                       XK_t,  	   setlayout,      {0} },
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_b,	   spawn,          {.v = dmenubluetoothcmd } },
	{ MODKEY,			XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,			XK_minus,  setgaps, 	   {.i = -1 } },
	{ MODKEY,			XK_equal,  setgaps, 	   {.i = +1 } },
	{ MODKEY|ShiftMask,		XK_equal,  setgaps, 	   {.i =  0 } },
	{ MODKEY,                       XK_F5,     xrdb,           {.v = NULL } },
	{ MODKEY|ShiftMask,		XK_q,      quit,           {0} },
	{ MODKEY,		        XK_s,	   spawn,	   {.v = slockcmd } },
	
	// for screenshots
	{ MODKEY,			XK_p,	spawn,		{.v = printscr } },
	{ MODKEY|ShiftMask,		XK_p,	spawn,          {.v = printsel } },
	{ MODKEY,			XK_y,   spawn,		{.v = printclip } },
	{ MODKEY|ShiftMask,		XK_y,   spawn,		{.v = printclipcopy } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
