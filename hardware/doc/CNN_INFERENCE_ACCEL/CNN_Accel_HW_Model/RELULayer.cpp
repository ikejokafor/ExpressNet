#include "RELULayer.h"

Layer::Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize) {
	m_inputRowSize		= inputRowSize;
	m_inputColSize		= inputColSize;
	m_inputDepthSize	= inputDepthSize;
	m_outputRowSize		= outputRowSize;
	m_outputColSize		= outputColSize;
	m_outputDepthSize	= outputDepthSize;
}

Layer::~Layer() {

}

Layer::ComputeLayer(InputData_t *inputdata, OutputData_t *outputData) {

	for(int i = 0; i < m_outputDepthSize; i++){
		for(int j = 0 ; j< m_outputRowSize; j++){
			for(int k = 0; k < m_outputColSize; k++) {
				outputData->data[(i * m_outputRowSize + j) * m_outputColSize + k] 
					= (inputdata->data[(i * m_intputRowSize + j) * m_intputColSize + k] < 0) ? 0.0f : inputdata->data[(i * m_intputRowSize + j) * m_intputColSize + k];
			}
		}
	}
}