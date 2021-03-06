clc
clear


MAX_AWP_PER_FAS     = 1;
NUM_QUAD_PER_AWP    = 1;
NUM_TOTAL_QUADS     = MAX_AWP_PER_FAS * NUM_QUAD_PER_AWP;
QUAD_MAX_KERNELS	= 64;
QUAD_MAX_DEPTH		= 8;
QUAD_DPTH_SIMD		= QUAD_MAX_DEPTH * NUM_TOTAL_QUADS;
KRNL_1x1_SIMD       = 8;


do_res_1x1          = 0;
do_1x1_res          = 1;
do_krnl1x1          = 0;
do_resLayer         = 0;


inputMapDepth = 16;
numInputMapRows = 16;
numInputMapCols = 16;
padding = 0;
stride = 1;
do_krnl_layer_1x1 = 0;
num3x3Kernels = 96;
num1x1Kernels = 56;
numKernelRows = 3;
numKernelCols = 3;
num3x3OutputRows = floor((numInputMapRows - numKernelRows + 2 * padding) / stride) + 1;
num3x3OutputCols = floor((numInputMapCols - numKernelCols + 2 * padding) / stride) + 1;
outputDepth3x3 = num3x3Kernels;
num1x1OutputRows = num3x3OutputRows;
num1x1OutputCols = num3x3OutputCols;
outputDepth1x1 = num1x1Kernels;



inputMaps = randi([1, 8], [numInputMapCols, numInputMapRows, inputMapDepth]);
kernels3x3 = randi([1, 8],[numKernelCols, numKernelRows, inputMapDepth, num3x3Kernels]);
bias3x3 = randi([1 8], [1, num3x3Kernels]);
if(do_krnl1x1 || do_res_1x1 || do_1x1_res)
    kernels1x1 = randi([1, 8],[1, 1, num3x3Kernels,  num1x1Kernels]);
    bias1x1 = randi([1 8], [1, num1x1Kernels]);
else
    kernels1x1 = [];
    bias1x1 = [];  
end
if(do_resLayer || do_res_1x1)
    residualMaps = randi([1, 8],[num3x3OutputCols, num3x3OutputRows, outputDepth3x3]);
elseif(do_resLayer || do_1x1_res)
    residualMaps = randi([1, 8],[num1x1OutputCols, num1x1OutputRows, outputDepth1x1]);
else
    residualMaps = [];
end


outputMapSol = Convolution(kernels3x3, bias3x3, inputMaps, num3x3OutputCols, num3x3OutputRows, outputDepth3x3);
if(do_res_1x1)
    outputMapSol = outputMapSol + residualMaps;    
    outputMapSol = Convolution(kernels1x1, bias1x1, outputMapSol, num1x1OutputCols, num1x1OutputRows, outputDepth1x1);
    do_krnl1x1 = 1;
    do_resLayer = 1;
elseif(do_1x1_res)
    outputMapSol = Convolution(kernels1x1, bias1x1, outputMapSol, num1x1OutputCols, num1x1OutputRows, outputDepth1x1);
    outputMapSol = outputMapSol + residualMaps;
    do_krnl1x1 = 1;
    do_resLayer = 1;
elseif(do_krnl1x1)
    outputMapSol = Convolution(kernels1x1, bias1x1, outputMapSol, num1x1OutputCols, num1x1OutputRows, outputDepth1x1);
elseif(do_resLayer)
    outputMapSol = outputMapSol + residualMaps;
end


num_krnl_iter = ceil(num3x3Kernels / QUAD_MAX_KERNELS);
num_depth_iter = ceil(inputMapDepth / QUAD_DPTH_SIMD);
remNumKrnl = num3x3Kernels;
krnlBgn = 1;
li_outMaps = [];
outputMapQry = [];
for i = 1:num_krnl_iter
    numKrnl = min(remNumKrnl, QUAD_MAX_KERNELS);
    remDepth = inputMapDepth;
    depthBgn = 1;
    for j = 1:num_depth_iter
        depth = min(QUAD_DPTH_SIMD, remDepth);
        [ ...
            li_inMaps, ...
            li_krnl3x3, ...
            li_krnl3x3bias, ...
            li_krnel1x1, ...
            li_partMaps, ...
            li_resMaps ...
        ] = CreateLayerParams( ...
            inputMaps, ...
            kernels3x3, ...
            bias3x3, ...
            kernels1x1, ...
            residualMaps, ...
            num_krnl_iter, ...
            i, ...
            num_depth_iter, ...
            j, ...
            depthBgn, ...
            depth, ...
            krnlBgn, ...
            numKrnl, ...
            do_1x1_res, ...
            do_resLayer, ...
            do_krnl1x1, ...
            do_krnl_layer_1x1, ...
            it_act3x3, ...
            it_act1x1, ...            
            li_outMaps ...
        );


        [ ...
            li_outMaps ...
        ] = Process( ...
            li_inMaps, ...
            li_krnl3x3, ...
            li_krnl3x3bias, ...
            li_krnel1x1, ...
            bias1x1, ...
            li_partMaps, ...
            li_resMaps, ...
            num_krnl_iter, ...
            i, ...
            num_depth_iter, ...
            j, ...
            num3x3OutputRows, ...
            num3x3OutputCols, ...
            numKrnl, ...
            num1x1OutputRows, ...
            num1x1OutputCols, ...
            outputDepth1x1, ...
            do_res_1x1, ...
            do_1x1_res, ...
            do_krnl1x1, ...
            do_resLayer, ...
            do_krnl_layer_1x1, ...
            outputMapQry ...
        );
        remDepth = remDepth - depth;
        depthBgn = depthBgn + depth;
    end
    li_outMaps = activate(li_outMaps, it_act3x3, it_act1x1)
    remNumKrnl = remNumKrnl - numKrnl;
    krnlBgn = krnlBgn + numKrnl;
    if(do_1x1_res || i == 1 || do_krnl1x1)
        outputMapQry = li_outMaps;
    else
        outputMapQry = cat(3, outputMapQry, li_outMaps);
    end
end


if(isequal(outputMapQry, outputMapSol))
    disp('Good');
else
    disp('Bad');
end
