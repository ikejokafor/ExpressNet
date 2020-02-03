#pragma once


#include "systemc"
#include "common.hpp"


class AWE_if : virtual public sc_core::sc_interface
{
	public:
		virtual void b_transaction(int quad_id, accel_cmd_t accel_cmd, int res_pkt_size) = 0;
};
