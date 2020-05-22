function ret = Convolution(kernels, bias, inputMaps, nOutCols, nOutRows, outDepth)
    ret = zeros(nOutCols, nOutRows, outDepth);
    for i = 1:size(kernels, 4)
        convSum = zeros(nOutCols, nOutRows);
        for j = 1:size(inputMaps, 3)                                
            inputMap_slice = inputMaps(:, :, j);
            kernel_slice = kernels(:, :, j, i);
            %flip kernel if values matter
            convSum = convSum + convn(inputMap_slice, kernel_slice, 'valid');
        end
        if(~isempty(bias))
            ret(:, :, i) = (convSum + bias(i));
        else
            ret(:, :, i) = convSum;
        end
    end
end
