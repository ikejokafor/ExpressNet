#ifndef __CONV_LAYER__
#define __CONV_LAYER__

// system includes


// opencv includes


// other includes
#include "Layer.h"


class FullyConnectedLayer_node : public Layer {

	public:
		Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize);
		~Layer();
		void ComputeLayer(InputData_t *inputdata, OutputData_t *outputData);
			
	protected:
	
	
	private:

	
};

#endif