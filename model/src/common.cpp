#include "common.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


void nb_createTrans(
	tlm_generic_payload** trans,
	uint64_t address, 
	tlm_command cmd, 
	unsigned char* data_ptr, 
	unsigned int dataLength, 
	unsigned int streamWidth,
	unsigned char* byteENptr,
	bool DMI_EN,
	tlm_response_status status
) {
	(*trans)->set_address(address);
	(*trans)->set_command(cmd);
	(*trans)->set_data_ptr(data_ptr);
	(*trans)->set_data_length(dataLength);
	(*trans)->set_streaming_width(streamWidth);
	(*trans)->set_byte_enable_ptr(byteENptr);
	(*trans)->set_dmi_allowed(DMI_EN);
	(*trans)->set_response_status(status);
}