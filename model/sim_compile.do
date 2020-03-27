vlib work

sccom -std=c++11 -I $env(WORKSPACE_PATH)/cnn_layer_accel/model/inc/ -I $env(WORKSPACE_PATH)/util/inc/ \
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/AWP.cpp \
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/AWPBus.cpp \
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/FAS.cpp \
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/Interconnect.cpp	\
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/QUAD.cpp \
	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/CNN_Layer_Accel.cpp
sccom -link
