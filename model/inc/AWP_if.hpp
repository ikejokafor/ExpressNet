#pragma once


#include "systemc"
#include "cnn_layer_accel_common.hpp"


class AWP_if : virtual public sc_core::sc_interface
{
	public:
	virtual void b_request(int QUAD_id, accel_cmd_t accel_cmd, int res_pkt_size) = 0;
	virtual void b_transaction(int idx) = 0;
};
