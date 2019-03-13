function [ split_positions ] = get_split_positions( image, staff_lines )
    split_positions(1) = max(staff_lines(1)-50, 1);
    for i=5:5:length(staff_lines(:))-1
        split_positions(end+1) = ceil(staff_lines(i) ...
            + ((staff_lines(i+1) - staff_lines(i)) / 2));
    end
    split_positions(end+1) = length(image(:,1));

end
