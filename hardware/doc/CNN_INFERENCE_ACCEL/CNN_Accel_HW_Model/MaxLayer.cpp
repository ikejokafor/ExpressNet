#include "MaxLayer.h"

Layer::Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize, FilerInfo_t filterInfo) {
	m_inputRowSize		= inputRowSize;
	m_inputColSize		= inputColSize;
	m_inputDepthSize	= inputDepthSize;
	m_outputRowSize		= outputRowSize;
	m_outputColSize		= outputColSize;
	m_outputDepthSize	= outputDepthSize;
	m_filterInfo_t 		= filterInfo;
}

Layer::Layer(int inputRowSize, int inputColSize, int inputDepthSize, int outputRowSize, int outputColSize, int outputDepthSize) {
	m_inputRowSize		= inputRowSize;
	m_inputColSize		= inputColSize;
	m_inputDepthSize	= inputDepthSize;
	m_outputRowSize		= outputRowSize;
	m_outputColSize		= outputColSize;
	m_outputDepthSize	= outputDepthSize;
}

Layer::ComputeLayer(InputData_t *inputdata, OutputData_t *outputData) {
	float maxValue;
	
	for(int d = 0; d < m_outputDepthSize; d++){
		for (int a = 0; a < m_outputRowSize; a ++){
			for (int b = 0; b < m_outputColSize; b++){
				maxValue = -FLT_MIN;
				for(int x = a; n1 < m_filterInfo->numFilterRows; x++) {
					for(int y = b; n2 < m_filterInfo->numFilterCols; y++) {
						maxValue = fmaxf(maxValue, inputdata->data[(d * m_inputRowSize + x) * m_inputColSize + y]);
					}
				}
				outputData->data[d * m_outputRowSize + a) * m_outputColSize + b] = maxValue;
			}
		}
	}
}