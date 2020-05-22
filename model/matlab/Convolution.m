function ret = Convolution(kernels, inputMaps, outputMap, bias)
    ret = zeros(size(outputMap, 1), size(outputMap, 2), size(outputMap, 3));
    for i = 1:size(kernels, 4)
        convSum = zeros(size(outputMap, 1), size(outputMap, 2));
        for j = 1:size(inputMaps, 3)                                
            inputMap_slice = inputMaps(:, :, j);
            kernel_slice = kernels(:, :, j, i);
            %flip kernel if values matter
            convSum = convSum + convn(inputMap_slice, kernel_slice, 'valid');
        end
        if(nargin == 4)
            ret(:, :, i) = (convSum + bias(i));
        else
            ret(:, :, i) = convSum;
        end
    end
end
