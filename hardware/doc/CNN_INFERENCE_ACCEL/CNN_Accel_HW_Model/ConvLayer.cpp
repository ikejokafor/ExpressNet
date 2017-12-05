#include "ConvLayer.h"

Layer::Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize) {
	m_inputRowSize		= inputRowSize;
	m_inputColSize		= inputColSize;
	m_inputDepthSize	= inputDepthSize;
	m_outputRowSize		= outputRowSize;
	m_outputColSize		= outputColSize;
	m_outputDepthSize	= outputDepthSize;
}

Layer::Layer() {
	
}

Layer::ComputeLayer(InputData_t *inputdata, OutputData_t *outputData) {

}