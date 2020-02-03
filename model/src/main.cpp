#include "systemc"
#include "Top.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;


int sc_main(int argc, char* argv[])
{
	sc_set_time_resolution(1, SC_NS);
	Top top("Top");
	sc_start();
	return 0;
}
