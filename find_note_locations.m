function [ locs_x, locs_y ] = find_note_locations( subimg, n )
    se_disk_small = strel('disk', 1);

    se_disk = strel('disk', 4);
    se_disk_large = strel('disk', 5);

    subimg_temp = [];

    for i_img=1:n

        subimg_temp{i_img} = imerode(subimg{i_img},se_disk);

        L = bwlabel(subimg_temp{i_img});
        note_heads = regionprops(L, 'Area');
        m_area = median([note_heads.Area]);

        subimg_temp{i_img} = imerode(subimg_temp{i_img},se_disk_small);

        subimg_temp{i_img} = imdilate(subimg_temp{i_img},se_disk_large);
        subimg_temp{i_img} = subimg_temp{i_img} > 0.01;

        note_heads = regionprops(subimg_temp{i_img}, 'Centroid');
        centroids = cat(1, note_heads.Centroid);
        locs_x{i_img} = centroids(:,1);
        locs_y{i_img} = centroids(:,2);
    end
end
