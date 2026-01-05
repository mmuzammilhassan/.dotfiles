//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"",  "sb-battery",  1, 1},
  {"",  "sb-internet", 5, 4},
  {"",  "sb-datetime", 1, 10},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
// static char delim[] = " | ";
static char delim[] = "  ";
static unsigned int delimLen = 5;
