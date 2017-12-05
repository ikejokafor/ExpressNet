#ifndef __FULLY_CONNECTED_LAYER__
#define __FULLY_CONNECTED_LAYER__

// system includes


// opencv includes


// other includes
#include "Layer.h"
#include "FullyConnectedLayer_node.h"


class FullyConnectedLayer : public Layer {

	public:
		Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize);
		~Layer();
		void ComputeLayer(InputData_t *inputdata, OutputData_t *outputData);
			
	protected:
	
	
	private:
		Layer **FullyConnectedLayer_node;
	
};

#endif