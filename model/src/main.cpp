#include "systemc"
#include "CNN_Layer_Accel.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;


int sc_main(int argc, char* argv[])
{
	sc_set_time_resolution(1, SC_NS);
	CNN_Layer_Accel CNN_Layer_Accel("CNN_Layer_Accel");
	sc_start();
	return 0;
}
