function [li_outMaps] = Process( ...
    li_inMaps, ...
    li_krnl3x3, ...
    li_krnl3x3bias, ...
    kernels1x1, ...
    bias1x1, ...
    li_partMaps, ...
    li_resMaps, ...
    num_krnl_iter, ...
    krnl_iter, ...
    num_depth_iter, ...
    dpth_iter, ...
    nOut3x3Rows, ...
    nOut3x3Cols, ...
    out3x3Dpth, ...
    nOut1x1Rows, ...
    nOut1x1Cols, ...
    out1x1Dpth, ...
    do_res_1x1, ...
    do_1x1_res, ...
    do_krnl1x1, ...
    do_resLayer, ...
    do_krnl_layer_1x1, ...
    prevLIOut ...
)
    if(dpth_iter == num_depth_iter)
        li_outMaps = Convolution(li_krnl3x3, li_krnl3x3bias, li_inMaps, nOut3x3Cols, nOut3x3Rows, out3x3Dpth);  
    else
        li_outMaps = Convolution(li_krnl3x3, [], li_inMaps, nOut3x3Cols, nOut3x3Rows, out3x3Dpth);
    end

    
    if(do_1x1_res && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter == 1)
        % 0
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + li_resMaps;      
    elseif(do_1x1_res && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter ~= 1)
        % 1
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;   
    elseif(do_1x1_res && dpth_iter == num_depth_iter && krnl_iter == 1)
        % 2
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + li_resMaps;       
    elseif(do_1x1_res && dpth_iter == num_depth_iter && krnl_iter ~= 1)
        % 3
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;
    elseif(do_res_1x1 && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter == 1)
        % 4
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = li_outMaps + li_resMaps;
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
    elseif(do_res_1x1 && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter ~= 1)
        % 5
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = li_outMaps + li_resMaps;
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;
    elseif(do_res_1x1 && dpth_iter == num_depth_iter && krnl_iter == 1)
        % 6
        li_outMaps = li_outMaps + li_resMaps;
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
    elseif(do_res_1x1 && dpth_iter == num_depth_iter && krnl_iter ~= 1)
        % 7
        li_outMaps = li_outMaps + li_resMaps;
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;
    elseif(do_resLayer && dpth_iter == num_depth_iter && num_depth_iter > 1)
        % 8
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = li_outMaps + li_resMaps;
    elseif(do_resLayer && dpth_iter == num_depth_iter && num_depth_iter == 1)
        % 9
        li_outMaps = li_outMaps + li_resMaps;
    elseif(do_krnl1x1 && ~do_krnl_layer_1x1 && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter == 1)
        % 10
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
    elseif(do_krnl1x1 && ~do_krnl_layer_1x1 && dpth_iter == num_depth_iter && num_depth_iter > 1 && krnl_iter ~= 1)
        % 11
        li_outMaps = li_outMaps + li_partMaps;
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;
    elseif(do_krnl1x1 && ~do_krnl_layer_1x1 && dpth_iter == num_depth_iter && krnl_iter == 1)
        % 12
        li_outMaps = Convolution(kernels1x1, bias1x1, li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
    elseif(do_krnl1x1 && ~do_krnl_layer_1x1 && dpth_iter == num_depth_iter && krnl_iter ~= 1)
        % 13
        li_outMaps = Convolution(kernels1x1, [], li_outMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
        li_outMaps = li_outMaps + prevLIOut;     
    elseif(do_krnl_layer_1x1)
        % 14
        li_outMaps = Convolution(kernels1x1, bias1x1, li_inMaps, nOut1x1Cols, nOut1x1Rows, out1x1Dpth);
    elseif(dpth_iter > 1)
        % 15
        li_outMaps = li_outMaps + li_partMaps;
    else
        % 16
        return
    end
    % 17 is residual only
end