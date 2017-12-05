image_red = rand(50,50);
image_green = rand(50,50);
image_blue = rand(50,50);

filter_red = rand(5,5);
filter_green = rand(5,5);
filter_blue = rand(5,5);

image_red_spatial_conv = zeros(46,46);
for i=1:46
    for j = 1:46
        m = i;
        pixel = 0;
        for a = 1:5
            n = j;
            for b = 1:5             
                pixel = pixel + image_red(m,n)*filter_red(a,b);
                n = n + 1;
            end
            m = m + 1;
        end
        image_red_spatial_conv(i,j) = pixel;
    end
end

image_green_spatial_conv = zeros(46,46);
for i=1:46
    for j = 1:46
        m = i;
        pixel = 0;
        for a = 1:5
            n = j;
            for b = 1:5             
                pixel = pixel + image_green(m,n)*filter_green(a,b);
                n = n + 1;
            end
            m = m + 1;
        end
        image_green_spatial_conv(i,j) = pixel;
    end
end

image_blue_spatial_conv = zeros(46,46);
for i=1:46
    for j = 1:46
        m = i;
        pixel = 0;
        for a = 1:5
            n = j;
            for b = 1:5             
                pixel = pixel + image_blue(m,n)*filter_blue(a,b);
                n = n + 1;
            end
            m = m + 1;
        end
        image_blue_spatial_conv(i,j) = pixel;
    end
end

image_spatial_conv = image_red_spatial_conv + image_green_spatial_conv + image_blue_spatial_conv;

image_red_fft = fft2(image_red);
image_green_fft = fft2(image_green);
image_blue_fft = fft2(image_blue);

filter_red_fft = fft2(filter_red,50,50);
filter_green_fft = fft2(filter_green,50,50);
filter_blue_fft = fft2(filter_blue,50,50);

image_red_fft_conv = image_red_fft.*conj(filter_red_fft);
image_green_fft_conv = image_green_fft.*conj(filter_green_fft);
image_blue_fft_conv = image_blue_fft.*conj(filter_blue_fft);

image_fft_conv = ifft2(image_red_fft_conv + image_green_fft_conv + image_blue_fft_conv);
image_fft_conv = image_fft_conv(1:46,1:46);


%{
image = rand(20,20);
filter = rand(3,3);
output = zeros(18,18);

for i=1:18
    for j = 1:18
        m = i;
        pixel = 0;
        for a = 1:3
            n = j;
            for b = 1:3              
                pixel = pixel +image(m,n)*filter(a,b);
                n = n + 1;
            end
            m = m + 1;
        end
        output(i,j) = pixel;
    end
end
output_fft = ifft2(fft2(image).*conj(fft2(filter,20,20)));
%}
