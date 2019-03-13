function [ subimg_clean ] = clean_image( subimg_no_sl, n )
    se_line = strel('line', 4, 90);
    subimg_clean = [];
    for i_img=1:n
        subimg_clean{i_img} = imdilate(subimg_no_sl{i_img},se_line);
    end
end
