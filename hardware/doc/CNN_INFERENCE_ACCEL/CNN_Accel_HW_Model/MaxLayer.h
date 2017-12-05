#ifndef __MAX_LAYER__
#define __MAX_LAYER__

// system includes


// opencv includes


// other includes
#include "Layer.h"


class MaxLayer : public Layer {

	public:
		Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize);
		~Layer();
		void ComputeLayer(InputData_t *inputdata, OutputData_t *outputData);
			
	protected:
	
	
	private:

	
};

#endif