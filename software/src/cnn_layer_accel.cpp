#include <cmath>
#include <string>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>

#include "cnn_layer_accel.h"



cnn_layer_accel::cnn_layer_accel(string identifier, uint8_t bus_id, uint8_t switch_id, uint8_t port_id, SocItAdapter* adapter)
{
	m_Name = identifier;

	m_IsConfigured = true;
	
	set_soc_it_adapter(adapter);
	SetDeviceAddress(bus_id, switch_id, port_id);

}

cnn_layer_accel::~cnn_layer_accel(void)
{
	
}

void cnn_layer_accel::Reset()
{
	get_soc_it_adapter()->Reset(m_DeviceAddress);
	m_IsConfigured = false;
}

string cnn_layer_accel::GetName()
{
	return m_Name;
}

void cnn_layer_accel::set_soc_it_adapter(SocItAdapter* adapter)
{
	m_SocItAdapter = adapter;
}

SocItAdapter* cnn_layer_accel::get_soc_it_adapter()
{
	return m_SocItAdapter;
}

void cnn_layer_accel::SetDeviceAddress(uint8_t bus_id, uint8_t switch_id, uint8_t port_id)
{
	m_DeviceAddress.set_bus_id(bus_id);
	m_DeviceAddress.set_switch_id(switch_id);
	m_DeviceAddress.set_port_id(port_id);
}

SocItAddress cnn_layer_accel::GetDeviceAddress()
{
	return m_DeviceAddress;
}

void cnn_layer_accel::Process() {

	SocItMessage* ProcessMessage = new SocItMessage(
		SocItMessageType::EXECUTE_REQUEST,
		NULL,
		GetDeviceAddress(),
		true);

	SocItHandle *testData = get_soc_it_adapter()->AllocateMemoryHandle(16);
	soc_it_data_ptr_t *testData_ptr = (soc_it_data_ptr_t*)testData->get_offset();
	testData_ptr->lower = 0xDEADBEEFBEEFDEAD;
	testData_ptr->upper = 0xBEEFDEADDEADBEEF;

	SocItHandle *commandData = get_soc_it_adapter()->AllocateMemoryHandle(sizeof(soc_it_data_ptr_t));
	soc_it_data_ptr_t *commandData_ptr = (soc_it_data_ptr_t*)commandData->get_offset();
	commandData_ptr->lower = testData->get_offset();
	commandData_ptr->upper = 16;

	ProcessMessage->AddBytes((uint8_t*)(commandData_ptr), commandData->get_size());

    
	get_soc_it_adapter()->SendSocItMessage(ProcessMessage);
	delete(ProcessMessage);
}
