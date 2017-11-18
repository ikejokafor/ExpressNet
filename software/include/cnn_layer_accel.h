#ifndef __CNN_LAYER_ACCEL__
#define __CNN_LAYER_ACCEL__

#include "soc_it_adapter.h"
#include "soc_it_capi.h"
#include "soc_it_message.h"
#include "image_descriptor.h"

typedef struct __reg128 {
	uint64_t lower;
	uint64_t upper;
}soc_it_data_ptr_t;

class cnn_layer_accel {

	public:
		cnn_layer_accel(string identifier, uint8_t bus_id, uint8_t switch_id, uint8_t port_id, SocItAdapter* adapter);
		~cnn_layer_accel(void);
		string GetName();
		void Reset();
		void Process();
		

	protected:

	private:
		string m_Name;

		bool m_IsConfigured;
	
		SocItAdapter* m_SocItAdapter;
		SocItAddress m_DeviceAddress;
	
		SocItAdapter* get_soc_it_adapter();
		void set_soc_it_adapter(SocItAdapter* adapter);

		SocItAddress GetDeviceAddress();
		void SetDeviceAddress(uint8_t bus_id, uint8_t switch_id, uint8_t port_id);

	
};

#endif
