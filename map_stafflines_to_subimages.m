function [ subimg_staff_lines ] = map_stafflines_to_subimages( staff_lines, split_pos )
    subimg_staff_lines = [];
    for i=1:length(split_pos)-1
        for j=1:5
            subimg_staff_lines{i}(j) = staff_lines((i-1)*5+j) - split_pos(i);
        end
    end
end
