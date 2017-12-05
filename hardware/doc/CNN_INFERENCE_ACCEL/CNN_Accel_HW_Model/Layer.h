#ifndef __LAYER__
#define __LAYER__

// system includes


// opencv includes

// other includes
#include "cnn_model_commons.h"

class Layer {

	public:
		virtual Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize) = 0;
		virtual ~Layer() = 0;
		virtual void ComputeLayer(InputData_t *inputdata, OutputData_t *outputData) = 0;
		
		
	protected:
	
	
	private:
		int m_inputRowSize;
		int m_inputColSize;
		int m_inputDepthSize;
		int m_outputRowSize;
		int m_outputColSize;
		int m_outputDepthSize;
	
};

#endif