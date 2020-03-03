#include "common.hpp"
using namespace std;
using namespace sc_core;
using namespace sc_dt;
using namespace tlm;
using namespace tlm_utils;


tlm_generic_payload* nb_createTLMTrans(
	mem_mng& mem_mng,
	uint64_t address, 
	tlm_command cmd,
	unsigned char* data_ptr, 
	unsigned int dataLength, 
	unsigned int streamWidth,
	unsigned char* byteENptr,
	bool DMI_EN,
	tlm_response_status status
) {
	tlm_generic_payload* trans = mem_mng.allocate();
	trans->acquire();
	trans->set_address(address);
	trans->set_command(cmd);
	trans->set_data_ptr(data_ptr);
	
	Accel_Trans* accel_trans;
	accel_trans = (Accel_Trans*)data_ptr;
	trans->set_data_length(dataLength);
	trans->set_streaming_width(streamWidth);
	trans->set_byte_enable_ptr(byteENptr);
	trans->set_dmi_allowed(DMI_EN);
	trans->set_response_status(status);
	return trans;
}