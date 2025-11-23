//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
//  {"",  "XAMI",  60,  60},
//  {"",	"nettraf", 1, 16},
//  {"",  "memory",   1,  1},
  {"",  "battery1",  1,  1},
  {"",  "volume1",   60, 1},
//  {"",  "ram4bars",  1,  1},
  {"",  "internet1", 60, 1},
  {"",  "cpu-bar1",  1,  1},
  {"",	"clock1",    30, 1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
//static char delim[] = " | ";
static unsigned int delimLen = 5;
