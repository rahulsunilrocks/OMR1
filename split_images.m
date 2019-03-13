function [ out_im ] = split_images( in_im, split_pos )
    out_im = [];
    for i=1:length(split_pos)-1
        out_im{i} = in_im(split_pos(i):split_pos(i+1),:);
    end
end
