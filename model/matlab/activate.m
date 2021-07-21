function [li_outMaps] = activate( ...
    li_outMaps, ...
    it_act3x3, ...
    it_act1x1 ...
)

    for i = 1:size(li_outMaps,1)
        for j = 1:size(li_outMaps,2)
            for k = 1:size(li_outMaps,3)
                if(li_outMaps(i, j, k) < 0)
                    li_outMaps(i, j, k) = li_outMaps(i, j, k) * 0.1;
            end
        end
    end    
end