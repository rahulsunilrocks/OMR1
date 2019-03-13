function [ out_image ] = remove_stafflines( in_image, staff_lines )
    out_image = in_image;
    for i=1:length(staff_lines(:))
        out_image(staff_lines(i)-1, :) = 0;
        out_image(staff_lines(i), :) = 0;
        out_image(staff_lines(i)+1, :) = 0;
    end
end
